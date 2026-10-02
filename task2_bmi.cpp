// Задание 2. Индекс массы тела (BMI).

#include <iostream>
using namespace std;

int main() {
    double mass, height, bmi;

    cout << "Введите массу (кг): ";
    cin >> mass;

    cout << "Введите рост (м): ";
    cin >> height;

    if (height > 0) {
        bmi = mass / (height * height);

        cout << "BMI = " << bmi << endl;
    }
    else {
        cout << "Ошибка: рост должен быть положительным." << endl;
    }

    return 0;
}
