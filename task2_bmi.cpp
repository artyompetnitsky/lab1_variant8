#include <iostream>
using namespace std;
double square(double x) {
    return x * x;
}

int main() {
    double mass, height, bmi;

    cout << "Введите массу (кг): ";
    cin >> mass;

    cout << "Введите рост (м): ";
    cin >> height;

    if (height > 0) {
        bmi = mass / square(height);

        cout << "BMI = " << bmi << endl;
    }
    else {
        cout << "Ошибка: рост должен быть положительным." << endl;
    }

    return 0;
}
