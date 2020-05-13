

#include <string>
#include <cstdlib>
#include <iostream>
#include <sstream>

using namespace std;

int main() {
	string binary = "0110110101001111", hexchar;
	int tmpValAsInt(0);
	int holdCount = binary.length() - 1;

	cout << "Binary Value: " << binary << endl;

	cout << "Hex Value: ";

	//reads 1 set of 4 at a time
	for (int count = 0; count < holdCount; count = count + 4) {
		
		//hexchar is a string that starts @ count and ends after reading 4 bits
		hexchar = binary.substr(count, 4);

		//cout << "hexchar: "<< hexchar << endl;
		//cout << "currentPos: " << count << endl;

		//convert hexchar string to int
		stringstream hexStream(hexchar);
		int binCount(0);
		hexStream >> tmpValAsInt;

		//cout << "asstmpValAsInt = " << tmpValAsInt << endl;

		//count binary value
		if (tmpValAsInt >= 1000) {
			binCount = binCount + 8;
			tmpValAsInt = tmpValAsInt - 1000;
		}
		if (tmpValAsInt >= 100) {
			binCount = binCount + 4;
			tmpValAsInt = tmpValAsInt - 100;
		}
		if (tmpValAsInt >= 10) {
			binCount = binCount + 2;
			tmpValAsInt = tmpValAsInt - 10;
		}
		if (tmpValAsInt >= 1) {
			binCount = binCount + 1;
			tmpValAsInt = tmpValAsInt - 1;
		} 

		if (binCount > 9) {
			cout << (char)(binCount + 55);
		}
		else {
			cout << binCount;
		}
	
	}

	cout << endl;
	return 0;
}

