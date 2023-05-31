import java.util.*;

public class UniqueNumberOfOccurrences {
    public boolean uniqueOccurrences(int[] arr) {
        HashMap<Integer, Integer> occurrences = new HashMap<Integer, Integer>();
        Set<Integer> uniques = new HashSet<>(Collections.emptySet());

        int occurNumber;

        for (int number : arr) {
            occurNumber = occurrences.getOrDefault(number, 0);
            occurrences.put(number, occurNumber + 1);
        }

        for (Map.Entry<Integer, Integer> occur : occurrences.entrySet()) {
            int repetition = occur.getValue();
            if (uniques.contains(repetition)) return false;
            uniques.add(repetition);
        }

        return true;
    }

    public static void main(String[] args) {
        int[] array = {2, 2, 1, 1, 3};
        System.out.println(new UniqueNumberOfOccurrences().uniqueOccurrences(array));
    }
}
