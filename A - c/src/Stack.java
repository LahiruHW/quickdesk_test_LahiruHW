import java.util.ArrayList;
import java.util.List;

public class Stack<T> implements IQueuable<T>{

    private ArrayList<T> stack = new ArrayList<>(0);

    public Stack() {}

    @Override
    public void enqueue(T value) {
        stack.add(value);
//        return stack;
    }
    public void push(T value){
        this.enqueue(value);
    }

    @Override
    public void enqueueList(List<T> lst) {
        for (T val : lst){
            this.enqueue(val);
        }
    }

    @Override
    public T dequeue() {
        int val = this.stack.size() - 1;
        T temp = this.stack.get( val );
        this.stack.remove( val );
        return temp;
    }
    public T pop(){
        return this.dequeue();
    }

    @Override
    public T peak(int index) {
        return this.stack.get(index);
    }

    @Override
    public ArrayList<T> getQueue() {
        return this.stack;
    }

    @Override
    public int size() {
        return stack.size();
    }

    @Override
    public String toString() {
        return this.stack.toString();
    }
}
