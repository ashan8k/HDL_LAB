// Integrated Electronic Systems Lab
// TU Darmstadt
// Author:	Dipl.-Ing. Boris Traskov
// Email: 	boris.traskov@ies.tu-darmstadt.de
// Purpose:	counts "i" from 0 up to 31

#define N 32

volatile int i = 0x76543210;	//marker in .bss field

main() {
	for (i=0; i<N; i++) {
	}
	return 0;
}
