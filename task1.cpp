#include <iostream>
#include <complex>
#include <cmath>
#include <cstdlib>
#include <ctime>
#include <fstream>
#include <omp.h>

using namespace std;

class vector
{
    int N;
    unsigned long ind;
    complex <double> *v;

    public:
    vector(){}
    vector(int n)
    {
        N = n;
        ind = pow(2, N);
        v = new complex <double> [ind];
        double x, y;
        int i;
        double sum = 0;
        srand (static_cast <unsigned> (time(0)));
        #pragma omp parallel for private (i, x, y)
        for (i = 0; i < ind; ++i)
        {
            x = -10000 + static_cast <double> (rand() * 1. / (static_cast <double> (RAND_MAX * 1. /(20000))));
            y = -10000 + static_cast <double> (rand() * 1. / (static_cast <double> (RAND_MAX * 1. /(20000))));
            v[i] = complex <double> (x, y);
            sum += pow(x, 2) + pow(y, 2);
        }
        sum = sqrt(sum);
        #pragma omp parallel for private(i)
        for (i = 0; i < ind; ++i)
        {
            v[i] = complex <double> (real(v[i])/sum, imag(v[i])/sum);
        }
    }
    ~vector()
    {
        delete []v;
    }

    void print_vector(ofstream &f);
    void converting(const vector &b, int k, double *H);
};

void vector::print_vector(ofstream &f)
{
    int i;
    for (i = 0; i < ind; ++i)
    {
        f << v[i] << ' ';
    }
    f << endl;
}

void vector::converting(const vector &b, int k, double *H)
{
    int i;
    int ik;
    unsigned int mask = (int) pow(2, N - k);
    #pragma omp parallel for private (i, ik) schedule (dynamic, ind / omp_get_num_threads())
    for (i = 0; i < ind; ++i)
    {
        ik = (i / (int) pow(2, N - k)) % 2; 
        if (! ik)
        {
            b.v[i] = H[ik * 2 + 0] * v[i] + H[ik * 2 + 1] * v[i + mask];
        }
        else
        {
            b.v[i] = H[ik * 2 + 0] * v[i - mask] + H[ik * 2 + 1] * v[i];
        }
    }
}

int main(int argc, char **argv)
{
    int threads = atoi(argv[1]);
    omp_set_num_threads(threads);

    int n = atoi(argv[2]);
    int k = atoi(argv[3]);

    ofstream t, f;
    t.open(argv[4], ios::app);
    f.open("vectors.txt", ios::trunc | ios::out);

    double *H;
    H = new double [4];
    H[0] = H[1] = H[2] = 1. /sqrt(2.);
    H[3] = -1. / sqrt(2.);

    double start, stop, ex_time;

    start = omp_get_wtime();

    vector a(n), b(n);

    a.converting(b, k, H);

    stop = omp_get_wtime();
    ex_time = stop - start;
    t << n << '\t' << threads << '\t' << ex_time << endl;

//    a.print_vector(f);
//    b.print_vector(f);

    t.close();
    f.close();

    delete []H;
    return 0;
}