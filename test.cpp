#include <iostream>
#include <complex>
#include <cmath>
#include <cstdlib>
#include <ctime>
#include <fstream>

using namespace std;

#define eps 0.01

class vector
{
    int N;
    int ind;
    complex <double> *v;

    public:
    vector(){}
    vector(int n)
    {
        N = n;
        ind = pow(2, N);
        v = new complex <double> [ind];
    }
    ~vector()
    {
        delete []v;
    }

    void print_vector(ofstream &f);
    void read_vector(ifstream &f);
    void converting(const vector &b, int k, double *H);
    int equal(const vector &b);
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

void vector::read_vector(ifstream &f)
{
    int i;
    for (i = 0; i < ind; ++i)
    {
        f >> v[i];
    }
}

void vector::converting(const vector &b, int k, double *H)
{
    int i;
    int ik;
    unsigned int mask = (int) pow(2, N - k);
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

int vector::equal(const vector &b)
{
    int i;
    int flag = 1;
    for (i = 0; i < ind; ++i)
    {
        if (abs(v[i] - b.v[i]) > eps)
        {
            flag--;
            break;
        }
    }
    return flag;
}

int main(int argc, char **argv)
{
    int n = atoi(argv[1]);
    int k = atoi(argv[2]);

    ifstream f;
    f.open("vectors.txt", ios::in);

    ofstream f2;
    f2.open("cntrl.txt", ios::trunc | ios::out);

    double *H;
    H = new double [4];
    H[0] = H[1] = H[2] = 1. /sqrt(2.);
    H[3] = -1. / sqrt(2.);

    vector a(n), b(n), c(n);
    a.read_vector(f);
    a.converting(b, k, H);
    c.read_vector(f);
    a.print_vector(f2);
    b.print_vector(f2);
    c.print_vector(f2);

    f.close();
    f2.close();

    if (! c.equal(b))
    {
        cout << "error" << endl;
        exit (-1);
    }
    else 
        cout << "correct" << endl;
    return 0;
}