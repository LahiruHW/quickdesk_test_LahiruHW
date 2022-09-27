import java.util.Arrays;
import java.util.List;

// improvements
    // change names of functions to be more in line with their classes
        // eg: "queue" to "add" and "put" for Queue and Stack
        // eg: "dequeue" to "serve" and "pop" for Queue and Stack

public class main {
    public static void main(String[] args) {

//        String[] lst1 = {"Hello", "this", "is", "a", "queue"};
//        List<String> lst11 = Arrays.asList(lst1);
        Integer[] lst1 = {1, 2, 3, 4, 5};
        List<Integer> lst11 = Arrays.asList(lst1);

        System.out.println( "Inserting " + lst11.toString() + " into a Queue" );
        Queue myQueue = new Queue();
        myQueue.enqueueList(lst11);
        System.out.println( "\t\t" + myQueue );
        System.out.println( "serving the queue once:" );
        myQueue.dequeue();
        System.out.println( "\t\t" + myQueue );


//        String[] lst2 = {"Hello", "this", "is", "a", "stack"};
//        List<String> lst22 = Arrays.asList(lst2);
        Integer[] lst2 = {1, 2, 3, 4, 5};
        List<Integer> lst22 = Arrays.asList(lst2);

        System.out.println( "\nInserting " + lst22.toString() + " into a Queue" );
        Stack myStack = new Stack();
        myStack.enqueueList(lst22);
        System.out.println( "\t\t" + myStack );
        System.out.println( "popping a value off the stack:" );
        myStack.pop();
        System.out.println( "\t\t" + myStack );

    }
}