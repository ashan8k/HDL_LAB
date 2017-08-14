// Integrated Electronic Systems Lab
// TU Darmstadt
// Author:	Dipl.-Ing. Boris Traskov
// Email: 	boris.traskov@ies.tu-darmstadt.de)
// Purpose:	copies "msg" to "dst"

#define N 46

static		char msg[N] = "A long time ago, in a galaxy far, far away...";
volatile	char dst[N];

main() {
	int i;
	for (i=0; i<N; i++) {
		dst[i] = msg[i];
	}
	return 0;
}
