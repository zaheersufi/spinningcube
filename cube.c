#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#include <math.h>


#ifdef _WIN32
    #include <windows.h>
    #define sleep_ms(ms) Sleep(ms)
#else
    #include <unistd.h>
    #define sleep_ms(ms) usleep((ms) * 1000)
#endif

#define _USE_MATH_DEFINES
#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif
#define MODEL_ROWS 8
#define SIZE 4
#define WINDOW_X 42
#define WINDOW_Y 42


#define MIN(a, b) ((a) < (b) ? (a) : (b))
#define MAX(a, b) ((a) > (b) ? (a) : (b)) 

//one more for homogeneous coord
double model_coords[MODEL_ROWS][SIZE] = {
    {-1, -1, -1, 1}, 
    {-1, -1, 1, 1},
    {-1, 1, -1, 1}, 
    {-1, 1, 1, 1},
    {1, -1, -1, 1}, 
    {1, -1, 1, 1},
    {1, 1, -1, 1}, 
    {1, 1, 1, 1}};

int triangle_coords[12][3] = {
    // Front
    {1, 5, 7}, {1, 7, 3},
    // Back
    {0, 2, 6}, {0, 6, 4},
    // Left
    {0, 1, 3}, {0, 3, 2},
    // Right
    {4, 6, 7}, {4, 7, 5},
    // Top
    {2, 3, 7}, {2, 7, 6},
    // Bottom
    {0, 4, 5}, {0, 5, 1}
};

double model_view[SIZE][SIZE] = {
    {0.5, 0, 0, 0},
    {0, 0.5, 0, 0},
    {0, 0, 0.5, 1},
    {0, 0, 0, 1}};


//Viewport transformation matrix to convert to screen coords
double viewport[SIZE][SIZE] = {
    {(double)WINDOW_X / 2, 0, 0, (double)(WINDOW_X - 1) / 2},
    {0, (double)WINDOW_Y / 2, 0, (double)(WINDOW_Y - 1 ) / 2},
    {0, 0, 1, 0},
    {0, 0, 0, 1}
};


void mult_mat_vec(double result[SIZE], double a[SIZE][SIZE], double b[SIZE]) {
    for(int i = 0; i < SIZE; ++i) {
        result[i] = 0.0;
        for(int j = 0; j < SIZE; ++j) {
            result[i] += a[i][j] * b[j];
        }
    }
}

double triangle_area(double x0, double y0, double x1, double y1, double x2, double y2) {
    return 0.5 * (x0 * (y1 - y2) + x1 * (y2 - y0) + x2 * (y0 - y1));
}


double rot_time = 0;



void render() {
    //output of the screen
    double z_buffer[WINDOW_Y][WINDOW_X];
    for (int y = 0; y < WINDOW_Y; y++) {
        for (int x = 0; x < WINDOW_X; x++) {
            z_buffer[y][x] = -10.0;
        }
    }

    //create rotation matrix
    double x_rotation_matrix[SIZE][SIZE] = {
        {1, 0, 0, 0},
        {0, cos(rot_time * M_PI / 180.0), sin(rot_time * M_PI / 180.0), 0},
        {0, -sin(rot_time * M_PI / 180.0), cos(rot_time * M_PI / 180.0), 0},
        {0, 0, 0, 1}
    };
    double y_rotation_matrix[SIZE][SIZE] = {
        {cos(3 * rot_time * M_PI / 180.0), 0, -sin(3 * rot_time * M_PI / 180.0), 0},
        {0, 1, 0, 0},
        {sin(3 * rot_time * M_PI / 180.0), 0, cos(3 * rot_time * M_PI / 180.0), 0},
        {0, 0, 0, 1}
    };


    //apply model matrix
    double temp_view_coords [MODEL_ROWS][SIZE];
    double temp_view_coords2 [MODEL_ROWS][SIZE];
    double view_coords [MODEL_ROWS][SIZE];
    for(int i = 0; i < MODEL_ROWS; ++i){
        mult_mat_vec(temp_view_coords[i], x_rotation_matrix, model_coords[i]); 
        mult_mat_vec(temp_view_coords2[i], y_rotation_matrix, temp_view_coords[i]); 
        mult_mat_vec(view_coords[i], model_view, temp_view_coords2[i]);
    }
    double pixel_coords [MODEL_ROWS][SIZE];
    for(int i = 0; i < MODEL_ROWS; ++i){
        mult_mat_vec(pixel_coords[i], viewport, view_coords[i]);
    }

    
    //iterate through each fragment
    //rasterize each fragment, getting z buffer (store greatest z)
    //make sure its within the bounding box

    double smallest_z = 1e9;
    double biggest_z = -1e9;

    for(int i = 0; i < 12; ++i){
        //first draw triangle bounding box based on pixels
        int tri_bb_x_min = pixel_coords[triangle_coords[i][0]][0];
        int tri_bb_x_max = tri_bb_x_min;
        int tri_bb_y_min = pixel_coords[triangle_coords[i][0]][1];
        int tri_bb_y_max = tri_bb_y_min;

        for(int j = 1; j < 3; ++j){
            tri_bb_x_min = MIN(tri_bb_x_min, pixel_coords[triangle_coords[i][j]][0]);
            tri_bb_x_max = MAX(tri_bb_x_max, pixel_coords[triangle_coords[i][j]][0]);

            tri_bb_y_min = MIN(tri_bb_y_min, pixel_coords[triangle_coords[i][j]][1]);
            tri_bb_y_max = MAX(tri_bb_y_max, pixel_coords[triangle_coords[i][j]][1]);

            smallest_z = MIN(smallest_z, pixel_coords[triangle_coords[i][j]][2]);
            biggest_z = MAX(biggest_z, pixel_coords[triangle_coords[i][j]][2]);
        }

        double v0x = pixel_coords[triangle_coords[i][0]][0];
        double v0y = pixel_coords[triangle_coords[i][0]][1];
        double v1x = pixel_coords[triangle_coords[i][1]][0];
        double v1y = pixel_coords[triangle_coords[i][1]][1];
        double v2x = pixel_coords[triangle_coords[i][2]][0];
        double v2y = pixel_coords[triangle_coords[i][2]][1];
        //calculate total area of the triangle without the point
        double big_area = triangle_area(v0x, v0y, v1x, v1y, v2x, v2y);
        if(big_area == 0.0)
            continue;
        //iterate through square

        for(int j = MAX(0, (int)tri_bb_x_min); j <= MIN((int)tri_bb_x_max, WINDOW_X - 1); ++j){
            for(int k = MAX(0, (int)tri_bb_y_min); k <= MIN((int)tri_bb_y_max, WINDOW_Y - 1); ++k) {
                //find barycentric coord

                double a_area = triangle_area(j, k, v1x, v1y, v2x, v2y) / big_area;
                double b_area = triangle_area(j, k, v2x, v2y, v0x, v0y) / big_area;
                //sum to one constraint, could just set c = 1 - a - b
                // double c_area = triangle_area(j, k, v0x, v0y, v1x, v1y) / big_area;
                double c_area = 1 - a_area - b_area;


                if (big_area > 0) {
                    if (a_area < 0 || b_area < 0 || c_area < 0)
                        continue;
                } else {
                    if (a_area > 0 || b_area > 0 || c_area > 0)
                        continue;
                }

                //calculate current z coord
                double curr_z = a_area * pixel_coords[triangle_coords[i][0]][2] + b_area * pixel_coords[triangle_coords[i][1]][2] + c_area * pixel_coords[triangle_coords[i][2]][2];
                //if coord is in triangle add to z buffer
                if(curr_z > z_buffer[k][j])
                    z_buffer[k][j] = curr_z;
            }
        }


        

        
    }

    printf("\x1b[H");
    for(int i = 0; i < WINDOW_Y; ++i) {
        for(int j = 0; j < WINDOW_X; ++j) {
            double curr_z = z_buffer[i][j];
            //8 ascii outputs
            //';+O#&@$
            //as it goes to the right more color
            //divide by 8 to get 0.375 intervals
            int bucket = (int)((curr_z - smallest_z) / (biggest_z - smallest_z) * 8);
            if (bucket > 7) bucket = 7;
            switch(bucket){
                case 0:
                    printf("'");
                    break;
                case 1:
                    printf(";");
                    break;
                case 2:
                    printf("+");
                    break;
                case 3:
                    printf("O");
                    break;
                case 4:
                    printf("#");
                    break;
                case 5:
                    printf("&");
                    break;
                case 6:
                    printf("@");
                    break;
                case 7:
                    printf("$");
                    break;
                default:
                    printf(" ");
            }

            //space in between
            printf(" ");
        }
        printf("\n");
    }


    printf("\n");
    printf("\n");

    
}



int main() {

    

    while(true){
        render();
        // sleep_ms(500);
        rot_time += 0.01;
    }
}