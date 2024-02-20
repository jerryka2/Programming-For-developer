package Question4;
import java.util.ArrayList;
import java.util.List;
import java.util.Stack;

class TreeNode {
    int val;
    TreeNode left;
    TreeNode right;

    TreeNode() {}

    TreeNode(int val) {
        this.val = val;
    }

    TreeNode(int val, TreeNode left, TreeNode right) {
        this.val = val;
        this.left = left;
        this.right = right;
    }
}

public class BinarySearchClosestValue {

    public List<Integer> closestKValues(TreeNode root, double target, int k) {
        List<Integer> result = new ArrayList<>();
        Stack<Integer> predStack = new Stack<>();
        Stack<Integer> succStack = new Stack<>();
        inorderPredecessor(root, target, predStack);
        inorderSuccessor(root, target, succStack);

        
        while (k-- > 0) {
            if (predStack.isEmpty()) {
                result.add(succStack.pop());
            } else if (succStack.isEmpty()) {
                result.add(predStack.pop());
            } else if (Math.abs(predStack.peek() - target) < Math.abs(succStack.peek() - target)) {
                result.add(predStack.pop());
            } else {
                result.add(succStack.pop());
            }
        }

        return result;
    }

    private void inorderPredecessor(TreeNode root, double target, Stack<Integer> stack) {
        if (root == null) return;

        inorderPredecessor(root.left, target, stack);
        if (root.val <= target) {
            stack.push(root.val);
        } else {
            return;
        }
        inorderPredecessor(root.right, target, stack);
    }

    private void inorderSuccessor(TreeNode root, double target, Stack<Integer> stack) {
        if (root == null) return;

        inorderSuccessor(root.right, target, stack);
        if (root.val > target) {
            stack.push(root.val);
        } else {
            return;
        }
        inorderSuccessor(root.left, target, stack);
    }

    public static void main(String[] args) {
        TreeNode root = new TreeNode(4);
        root.left = new TreeNode(2);
        root.right = new TreeNode(5);
        root.left.left = new TreeNode(1);
        root.left.right = new TreeNode(3);

        double target = 3.8;
        int k = 2;

        BinarySearchClosestValue BinarySearchClosestValue = new BinarySearchClosestValue();
        List<Integer> result = BinarySearchClosestValue.closestKValues(root, target, k);

        
        List<Integer> reversedResult = new ArrayList<>();
        for (int i = result.size() - 1; i >= 0; i--) {
            reversedResult.add(result.get(i));
        }
        System.out.println(reversedResult); 
    }
}
