
int main() {
	
	int k;
	/* gcc asm */
	__asm ( "ABC" );
	__asm volatile ("ABC");
	__asm ("DDD" : "ekekre" (kkekrek), "kkkere" (erew));
	__asm ("DDD" : "ekekre" (kkekrek), "kkkere" (erew) : "ekekre" (kkekrek), "kkkere" (erew));
	__asm ("DDD" : "ekekre" (kkekrek), "kkkere" (erew) : "ekekre" (kkekrek), "kkkere" (erew): "clob1", "clob2");
	
	/* __alignof__ */
	k = __alignof__(int);
	
	/* integer constant */
	k = 3 + 0x80000000;

	k = 3E-2;
	k = 3e+2;
		
	return 0;
}
;


