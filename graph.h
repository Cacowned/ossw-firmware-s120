#ifndef GRAPH_H
#define GRAPH_H

#include <stdint.h>

#define PI 3.1415926535
#define PI_2 2*PI
#define DEG_TO_RAD(deg) deg * PI / 180.0
#define CENTER_X (MLCD_XRES >> 1)
#define CENTER_Y (MLCD_YRES >> 1)
#define SWAP(a, b) {a ^= b; b ^= a; a ^= b;}
#define SIGN(a) (a > 0 ? 1 : (a < 0 ? -1 : 0))

void pixel(uint_fast8_t x_pos, uint_fast8_t y_pos);
void hLine(uint_fast8_t x1, uint_fast8_t y, uint_fast8_t x2);
void lineBresenham(uint_fast8_t x1, uint_fast8_t y1, uint_fast8_t x2, uint_fast8_t y2);
void lineEFLA(uint_fast8_t x, uint_fast8_t y, uint_fast8_t x2, uint_fast8_t y2);
void triangle(uint_fast8_t x0, uint_fast8_t y0, uint_fast8_t x1, uint_fast8_t y1, uint_fast8_t x2, uint_fast8_t y2);
void tetragon(uint_fast8_t x0, uint_fast8_t y0, uint_fast8_t x1, uint_fast8_t y1, uint_fast8_t x2, uint_fast8_t y2, uint_fast8_t x3, uint_fast8_t y3);
void fillConvex(int_fast8_t size, int16_t x[], int16_t y[]);
void circle(uint_fast8_t xc, uint_fast8_t yc, uint_fast8_t r);
void fillCircle(uint_fast8_t xc, uint_fast8_t yc, uint_fast8_t r);
void fillRectangle(uint_fast8_t x, uint_fast8_t y, uint_fast8_t w, uint_fast8_t h);

void radialLine(int16_t cx, int16_t cy, int16_t deg, int16_t r1, int16_t r2);
void radialTriangle(int16_t cx, int16_t cy, int16_t deg, int16_t r1, int16_t r2, uint_fast8_t thickness);
void radialRect(int16_t cx, int16_t cy, int16_t deg, int16_t r1, int16_t r2, uint_fast8_t thickness);

#endif /* GRAPH_H */
