import java.sql.Array;

public class MergeSortedArrays {

    public void merge(int[] nums1, int m, int[] nums2, int n) {
        if (nums1.length == 0 || nums2.length == 0) return;

        int idx1 = m - 1;
        int idx2 = n - 1;
        int idxWrite = n + m - 1;
        int numTmp;

        while (idxWrite >= 0) {
            if (idx1 >= 0 && idx2 >= 0 && nums1[idx1] > nums2[idx2] || idx2 < 0) {
                numTmp = nums1[idxWrite];
                nums1[idxWrite] = nums1[idx1];
                nums1[idx1] = numTmp;
                idx1--;
            } else {
                nums1[idxWrite] = nums2[idx2];
                idx2--;
            }

            idxWrite--;
        }
    }

    public static void main(String[] args) {
        int[] nums1 = {0};
        int m = 0;
        int[] nums2 = {1};
        int n = 1;

        new MergeSortedArrays().merge(nums1, m, nums2, n);

        System.out.println(nums1);
    }

}
