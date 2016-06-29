package cn.bdqn.wh;

public class Test1 {
	public static void main(String[] args) {
		String str = "1,2;3,4,5;6,7,8";
		String[] strs = str.split(";");
		int[][] nums = new int[strs.length][];
		for (int i=0; i<strs.length; i++) {
			String[] strss = strs[i].split(",");
			for (int j=0; j<strss.length; j++) {
				System.out.print(strss[j]+"\t");
				nums[i][j] = Integer.parseInt(strss[j]);
				System.out.println(nums[i][j]+"\t");
			}
			
		}
		
		
//		String s = "0";
//		int num = Integer.parseInt("1");
//		System.out.println(num);
	}
}
