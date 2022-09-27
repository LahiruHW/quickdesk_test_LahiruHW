import java.util.ArrayList;

public class Stack implements IQueuable{

    private ArrayList<String> stack = new ArrayList<>(0);

    public Stack() {}

    @Override
    public ArrayList<String> enqueue(String value) {
        stack.add(value);
        return stack;
    }

    @Override
    public String dequeue() {
        int val = this.stack.size() - 1;
        String temp = this.stack.get( val );
        this.stack.remove( val );
        return temp;
    }

    @Override
    public ArrayList<String> getQueue() {
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
