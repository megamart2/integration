import fi.hut.ics.lime.tester.LCT;

public final class Sort {

        /**
        * Simple insertion sort.
        * @param a an array of IntContainer items.
        */
        public static void insertionSort( IntContainer [ ] a )
        {
            int j;

            for( int p = 1; p < a.length; p++ ) {
                IntContainer tmp = a[ p ];

                for( j = p; j > 0 && tmp.compareTo( a[ j - 1 ] ) < 0; j-- )
                    a[ j ] = a[ j - 1 ];

                a[ j ] = tmp;
            }
        }

        /**
         * Shellsort, using Shell's (poor) increments.
         * @param a an array of IntContainer items.
         */
        public static void shellsort( IntContainer [ ] a )
        {
            int j;

/* 1*/      for( int gap = a.length / 2; gap > 0; gap /= 2 )
/* 2*/          for( int i = gap; i < a.length; i++ )
                {
/* 3*/              IntContainer tmp = a[ i ];
/* 4*/              for( j = i; j >= gap &&
                                tmp.compareTo( a[ j - gap ] ) < 0; j -= gap )
/* 5*/                  a[ j ] = a[ j - gap ];
/* 6*/              a[ j ] = tmp;
                }
        }


        /**
         * Standard heapsort.
         * @param a an array of IntContainer items.
         */
        public static void heapsort( IntContainer [ ] a )
        {
            for( int i = a.length / 2; i >= 0; i-- )
                percDown( a, i, a.length );
            for( int i = a.length - 1; i > 0; i-- )
            {
                swapReferences( a, 0, i );
                percDown( a, 0, i );
            }
        }

        /**
         * Internal method for heapsort.
         * @param i the index of an item in the heap.
         * @return the index of the left child.
         */
        private static int leftChild( int i )
        {
            return 2 * i + 1;
        }

        /**
         * Internal method for heapsort that is used in
         * deleteMax and buildHeap.
         * @param a an array of IntContainer items.
         * @index i the position from which to percolate down.
         * @int n the logical size of the binary heap.
         */
        private static void percDown( IntContainer [ ] a, int i, int n )
        {
            int child;
            IntContainer tmp;

            for( tmp = a[ i ]; leftChild( i ) < n; i = child )
            {
                child = leftChild( i );
                if( child != n - 1 && a[ child ].compareTo( a[ child + 1 ] ) < 0 )
                    child++;
                if( tmp.compareTo( a[ child ] ) < 0 )
                    a[ i ] = a[ child ];
                else
                    break;
            }
            a[ i ] = tmp;
        }

        /**
         * Mergesort algorithm.
         * @param a an array of IntContainer items.
         */
        public static void mergeSort2( IntContainer [ ] a )
        {
            IntContainer [ ] tmpArray = new IntContainer[ a.length ];

            mergeSort2( a, tmpArray, 0, a.length - 1 );
        }

        /**
         * Internal method that makes recursive calls.
         * @param a an array of IntContainer items.
         * @param tmpArray an array to place the merged result.
         * @param left the left-most index of the subarray.
         * @param right the right-most index of the subarray.
         */
        private static void mergeSort2( IntContainer [ ] a, IntContainer [ ] tmpArray,
                   int left, int right )
        {
            if( left < right )
            {
                int center = ( left + right ) / 2;
                mergeSort2( a, tmpArray, left, center );
                mergeSort2( a, tmpArray, center + 1, right );
                merge( a, tmpArray, left, center + 1, right );
            }
        }

        /**
         * Internal method that merges two sorted halves of a subarray.
         * @param a an array of IntContainer items.
         * @param tmpArray an array to place the merged result.
         * @param leftPos the left-most index of the subarray.
         * @param rightPos the index of the start of the second half.
         * @param rightEnd the right-most index of the subarray.
         */
        private static void merge( IntContainer [ ] a, IntContainer [ ] tmpArray,
               int leftPos, int rightPos, int rightEnd )
        {
            int leftEnd = rightPos - 1;
            int tmpPos = leftPos;
            int numElements = rightEnd - leftPos + 1;

            // Main loop
            while( leftPos <= leftEnd && rightPos <= rightEnd )
                if( a[ leftPos ].compareTo( a[ rightPos ] ) <= 0 )
                    tmpArray[ tmpPos++ ] = a[ leftPos++ ];
                else
                    tmpArray[ tmpPos++ ] = a[ rightPos++ ];

            while( leftPos <= leftEnd )    // Copy rest of first half
                tmpArray[ tmpPos++ ] = a[ leftPos++ ];

            while( rightPos <= rightEnd )  // Copy rest of right half
                tmpArray[ tmpPos++ ] = a[ rightPos++ ];

            // Copy tmpArray back
            for( int i = 0; i < numElements; i++, rightEnd-- )
                a[ rightEnd ] = tmpArray[ rightEnd ];
        }

        /**
         * Quicksort algorithm.
         * @param a an array of IntContainer items.
         */
        public static void quicksort( IntContainer [ ] a )
        {
            quicksort( a, 0, a.length - 1 );
        }

        private static final int CUTOFF = 10;

        /**
         * Method to swap to elements in an array.
         * @param a an array of objects.
         * @param index1 the index of the first object.
         * @param index2 the index of the second object.
         */
        public static final void swapReferences( Object [ ] a, int index1, int index2 )
        {
            Object tmp = a[ index1 ];
            a[ index1 ] = a[ index2 ];
            a[ index2 ] = tmp;
        }

        /**
         * Return median of left, center, and right.
         * Order these and hide the pivot.
         */
        private static IntContainer median3( IntContainer [ ] a, int left, int right )
        {
            int center = ( left + right ) / 2;
            if( a[ center ].compareTo( a[ left ] ) < 0 )
                swapReferences( a, left, center );
            if( a[ right ].compareTo( a[ left ] ) < 0 )
                swapReferences( a, left, right );
            if( a[ right ].compareTo( a[ center ] ) < 0 )
                swapReferences( a, center, right );

                // Place pivot at position right - 1
            swapReferences( a, center, right - 1 );
            return a[ right - 1 ];
        }

        /**
         * Internal quicksort method that makes recursive calls.
         * Uses median-of-three partitioning and a cutoff of 10.
         * @param a an array of IntContainer items.
         * @param left the left-most index of the subarray.
         * @param right the right-most index of the subarray.
         */
        private static void quicksort( IntContainer [ ] a, int left, int right )
        {
/* 1*/      if( left + CUTOFF <= right )
            {
/* 2*/          IntContainer pivot = median3( a, left, right );

                    // Begin partitioning
/* 3*/          int i = left, j = right - 1;
/* 4*/          for( ; ; )
                {
/* 5*/              while( a[ ++i ].compareTo( pivot ) < 0 ) { }
/* 6*/              while( a[ --j ].compareTo( pivot ) > 0 ) { }
/* 7*/              if( i < j )
/* 8*/                  swapReferences( a, i, j );
                    else
/* 9*/                  break;
                }

/*10*/          swapReferences( a, i, right - 1 );   // Restore pivot

/*11*/          quicksort( a, left, i - 1 );    // Sort2 small elements
/*12*/          quicksort( a, i + 1, right );   // Sort2 large elements
            }
            else  // Do an insertion sort on the subarray
/*13*/          insertionSort2( a, left, right );
        }

        /**
         * Internal insertion sort routine for subarrays
         * that is used by quicksort.
         * @param a an array of IntContainer items.
         * @param left the left-most index of the subarray.
         * @param right the right-most index of the subarray.
         */
        private static void insertionSort2( IntContainer [ ] a, int left, int right )
        {

            for( int p = left + 1; p <= right; p++ )
            {
                IntContainer tmp = a[ p ];
                int j;

                for( j = p; j > left && tmp.compareTo( a[ j - 1 ] ) < 0; j-- )
                    a[ j ] = a[ j - 1 ];
                a[ j ] = tmp;
            }
        }

        /**
         * Quick selection algorithm.
         * Places the kth smallest item in a[k-1].
         * @param a an array of IntContainer items.
         * @param k the desired rank (1 is minimum) in the entire array.
         */
        public static void quickSelect( IntContainer [ ] a, int k )
        {
            quickSelect( a, 0, a.length - 1, k );
        }

        /**
         * Internal selection method that makes recursive calls.
         * Uses median-of-three partitioning and a cutoff of 10.
         * Places the kth smallest item in a[k-1].
         * @param a an array of IntContainer items.
         * @param left the left-most index of the subarray.
         * @param right the right-most index of the subarray.
         * @param k the desired index (1 is minimum) in the entire array.
         */
        private static void quickSelect( IntContainer [ ] a, int left,
                                                int right, int k )
        {
/* 1*/      if( left + CUTOFF <= right )
            {
/* 2*/          IntContainer pivot = median3( a, left, right );

                    // Begin partitioning
/* 3*/          int i = left, j = right - 1;
/* 4*/          for( ; ; )
                {
/* 5*/              while( a[ ++i ].compareTo( pivot ) < 0 ) { }
/* 6*/              while( a[ --j ].compareTo( pivot ) > 0 ) { }
/* 7*/              if( i < j )
/* 8*/                  swapReferences( a, i, j );
                    else
/* 9*/                  break;
                }

/*10*/          swapReferences( a, i, right - 1 );   // Restore pivot

/*11*/          if( k <= i )
/*12*/              quickSelect( a, left, i - 1, k );
/*13*/          else if( k > i + 1 )
/*14*/              quickSelect( a, i + 1, right, k );
            }
            else  // Do an insertion sort on the subarray
/*15*/          insertionSort2( a, left, right );
        }


        private static final int NUM_ITEMS = 5;
        //private static int theSeed = 1;



        public static boolean isSorted (IntContainer a[]) {
            for(int i = a.length - 1; i > 0; i--)
                if(a[i].value < a[i-1].value)
                    return false;

            return true;
        }

        public static void main( String [ ] args )
        {
            int j = 1;

            IntContainer [ ] a = new IntContainer[ NUM_ITEMS ];
            for( int i = 0; i < a.length; i++ )
              //  a[ i ] = (IntContainer)LCT.getObject("IntContainer"); // new IntContainer( i );
              a[i] = new IntContainer(LCT.getInteger());

                Sort.insertionSort( a );
  
               // Sort.heapsort( a );

               // Sort.shellsort( a );

               // Sort.mergeSort2( a );

               // Sort.quicksort( a );

                 for (int jj = 0; jj < a.length; jj++)
                     System.out.println(a[jj].value);
        
                if(!isSorted(a))
                    j = j / 0;


        }
    }
