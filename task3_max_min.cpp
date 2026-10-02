// Задание 3. Максимум и минимум из трех чисел.

#include <iostream>
using namespace std;

int main() {
    double a, b, c;
    double max, min;

    cout << "Введите три числа: ";
    cin >> a >> b >> c;

    if (a == b && b == c) {
        cout << "Все три числа равны." << endl;
    }
    else {
        if (a >= b && a >= c)
            max = a;
        else if (b >= a && b >= c)
            max = b;
        else
            max = c;

        if (a <= b && a <= c)
            min = a;
        else if (b <= a && b <= c)
            min = b;
        else
            min = c;

        cout << "Максимум: " << max << endl;
        cout << "Минимум: " << min << endl;
    }

    return 0;
}
