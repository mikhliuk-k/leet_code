import java.text.MessageFormat;
import java.util.HashMap;
import java.util.Map;

class RomanToInteger {
    private static final HashMap<Character, Integer> numbers = new HashMap<Character, Integer>();

    static {
        numbers.put('M', 1000);
        numbers.put('D', 500);
        numbers.put('C', 100);
        numbers.put('L', 50);
        numbers.put('X', 10);
        numbers.put('V', 5);
        numbers.put('I', 1);
    }

    public int romanToInt(String s) {
        int charIndex;
        int totalResult = 0;
        int romanInt;
        int romanIntNext;

        for (charIndex = 0; charIndex < (s.length() - 1); charIndex += 1) {
            romanInt = numbers.get(s.charAt(charIndex));
            romanIntNext = numbers.get(s.charAt(charIndex + 1));

            if (romanInt >= romanIntNext) {
                totalResult += romanInt;
            } else {
                totalResult -= romanInt;
            }
        }

        totalResult += numbers.get(s.charAt(s.length() - 1));

        return totalResult;
    }

    public static void main(String[] args) {
        new RomanToInteger().romanToInt("CMXCIV");
    }
}
