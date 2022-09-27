import java.util.ArrayList;

public class main {
    public static void main(String[] args) {

        System.out.println( "Inserting the list of strings ['Hello', 'this', 'is', 'a', 'queue']" );
        Queue myQueue = new Queue();
        ArrayList<String> newQueue1 = myQueue.enqueue("Hello");
        ArrayList<String> newQueue2 = myQueue.enqueue("this");
        ArrayList<String> newQueue3 = myQueue.enqueue("is");
        ArrayList<String> newQueue4 = myQueue.enqueue("a");
        ArrayList<String> newQueue5 = myQueue.enqueue("queue");
        System.out.println( newQueue5 );

        System.out.println( "\nInserting the list of strings ['Hello', 'this', 'is', 'a', 'stack']" );
        Stack myStack = new Stack();
        ArrayList<String> newStack1 = myStack.enqueue("Hello");
        ArrayList<String> newStack2 = myStack.enqueue("this");
        ArrayList<String> newStack3 = myStack.enqueue("is");
        ArrayList<String> newStack4 = myStack.enqueue("a");
        ArrayList<String> newStack5 = myStack.enqueue("stack");
        System.out.println( newStack5 );

    }
}