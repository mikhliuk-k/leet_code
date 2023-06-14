public class ValidParentheses {
    public boolean isValid(String s) {
        Stack<Character> parentheses = new Stack<Character>();
        char currChar, prevChar;
        char op = '(', cp = ')', osb = '[', csb = ']', ocb = '{', ccb = '}';

        for (int i = 0; i < s.length(); i++) {
            currChar = s.charAt(i);

            if (currChar == op || currChar == osb || currChar == ocb) {
                parentheses.push(currChar);
            } else if (currChar == cp || currChar == csb || currChar == ccb) {
                if (parentheses.isEmpty()) return false;

                prevChar = parentheses.pop();

                if (prevChar == op && currChar != cp || prevChar == osb && currChar != csb || prevChar == ocb && currChar != ccb) {
                    return false;
                }
            }
        }

        return parentheses.isEmpty();
    }
}
