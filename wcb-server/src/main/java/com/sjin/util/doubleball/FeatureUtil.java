package com.sjin.util.doubleball;

import org.apache.commons.lang.StringUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * Description:  分析 开奖记录 特征 工具类
 * 创建日期: 7/23  11:13
 * @author: guanshj QQ: 928990049
 *
 *                          _oo0oo_
 *                         o8888888o
 *                         88" . "88
 *                         (| -_- |)
 *                         0\  =  /0
 *                       ___/'---'\___
 *                     .' \\|     |// '.
 *                    / \\|||  :  |||// \
 *                   / _||||| -:- |||||_ \
 *                  |   | \\\  -  /// |   |
 *                  | \_|  ''\---/''  |_/ |
 *                  \  .-\__  '-'  __/-.  /
 *               ____'. .'  /--.--\  '. .'____
 *            .""  '<  `.___\_<|>_/___.'  >'  "".
 *           | | :   `_ \`.;`\ _ /`;.`/ _'   : | |
 *           \  \  `_.   \_ __\ /__ _/   ._'  /  /
 *       =====`-._____`.___ \_____/ ___.`_____.-`=====
 *                          '=---='
 *
 *       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 *
 *                     佛祖保佑   中500万
 *
 */
public class FeatureUtil {
    /**
     * 获取 三分区比
     *
     * @param redList
     * @return
     */
    public static String getPartition3(List<Integer> redList) {
        int a = 0, b = 0, c = 0;
        for (Integer item : redList) {
            if (item >= 1 && item <= 11) {
                a++;
            } else if (item >= 12 && item <= 22) {
                b++;
            } else if (item >= 23 && item <= 33) {
                c++;
            }
        }
        return a + "-" + b + "-" + c;
    }

    /**
     * 获取 四分区比
     *
     * @param redList
     * @return
     */
    public static String getPartition4(List<Integer> redList) {
        int a = 0, b = 0, c = 0, d = 0;
        for (Integer item : redList) {
            if (item >= 1 && item <= 8) {
                a++;
            } else if (item >= 9 && item <= 16) {
                b++;
            } else if (item >= 18 && item <= 25) {
                c++;
            } else if (item >= 26 && item <= 33) {
                d++;
            }
        }
        return a + "-" + b + "-" + c + "-" + d;
    }

    /**
     * 获取 七分区比
     *
     * @param redList
     * @return
     */
    public static String getPartition7(List<Integer> redList) {
        int a = 0, b = 0, c = 0, d = 0, e = 0, f = 0, g = 0;
        for (Integer item : redList) {
            if (item >= 1 && item <= 5) {
                a++;
            } else if (item >= 6 && item <= 10) {
                b++;
            } else if (item >= 11 && item <= 15) {
                c++;
            } else if (item >= 16 && item <= 20) {
                d++;
            } else if (item >= 21 && item <= 25) {
                e++;
            } else if (item >= 26 && item <= 30) {
                f++;
            } else if (item >= 31 && item <= 33) {
                g++;
            }
        }
        return a + "-" + b + "-" + c + "-" + d + "-" + e + "-" + f + "-" + g;
    }

    /**
     * 获取 三分区的断区， 多个用","隔开
     * @param redList
     * @return
     */
    public static String getPartition3break(List<Integer> redList) {
        StringBuilder sb = new StringBuilder();

        String partition = getPartition3(redList);
        String[] paArr = partition.split("-");
        for(int i = 1 ; i<=paArr.length ; i++){
            if(Integer.parseInt(paArr[i-1]) == 0){
                sb.append(","+i);
            }
        }
        return StringUtils.isEmpty(sb.toString()) ? sb.toString() : sb.toString().substring(1);
    }
    /**
     * 获取 四分区的断区， 多个用","隔开
     * @param redList
     * @return
     */
    public static String getPartition4break(List<Integer> redList) {
        StringBuilder sb = new StringBuilder();

        String partition = getPartition4(redList);
        String[] paArr = partition.split("-");
        for(int i = 1 ; i<=paArr.length ; i++){
            if(Integer.parseInt(paArr[i-1]) == 0){
                sb.append(","+i);
            }
        }
        return StringUtils.isEmpty(sb.toString()) ? sb.toString() : sb.toString().substring(1);
    }
    /**
     * 获取 四分区的断区， 多个用","隔开
     * @param redList
     * @return
     */
    public static String getPartition7break(List<Integer> redList) {
        StringBuilder sb = new StringBuilder();

        String partition = getPartition7(redList);
        String[] paArr = partition.split("-");
        for(int i = 1 ; i<=paArr.length ; i++){
            if(Integer.parseInt(paArr[i-1]) == 0){
                sb.append(","+i);
            }
        }
        return StringUtils.isEmpty(sb.toString()) ? sb.toString() : sb.toString().substring(1);
    }

    /**
     * 获取 大小比例
     * @param redList
     * @return
     */
    public static String getSizeRatio (List<Integer> redList) {
        int a = 0 ,b =0;
        for(Integer item : redList){
            if( item < 17 ){
                a++;
            }else{
                b++;
            }
        }
        return a + ":" + b;
    }

    /**
     * 获取 奇偶比例
     * @param redList
     * @return
     */
    public static String getOddeven (List<Integer> redList) {
        int a = 0 ,b =0;
        for(Integer item : redList){
            if( item % 2 == 0 ){
                b++;
            }else{
                a++;
            }
        }
        return a + ":" + b;
    }

    /**
     * 获取 和值
     * @param redList
     * @return
     */
    public static int getSum (List<Integer> redList) {
        int sum =0;
        for(Integer item : redList){
            sum += item;
        }
        return sum;
    }

    /**
     * 获取 跨度值
     * @param redList
     * @return
     */
    public static int getSpan (List<Integer> redList) {
        int max = 0, min = 34; // 保证在下面的判断中，第一次时，任何数比max大，比min小
        for(Integer item : redList){
            if(item > max) max = item;
            if(item < min) min = item;
        }
        return max - min;
    }

    /**
     * 获取 龙头（最小值）
     * @param redList
     * @return
     */
    public static int getFirst (List<Integer> redList) {
        int min = 34;
        for(Integer item : redList){
            if(item < min) min = item;
        }
        return min;
    }
    /**
     * 获取 凤尾（最大值）
     * @param redList
     * @return
     */
    public static int getLast (List<Integer> redList) {
        int max = 0;
        for(Integer item : redList){
            if(item > max) max = item;
        }
        return max;
    }

    /** test fn **/
    public static void main(String[] args) {
        List<Integer> redList = new ArrayList<Integer>();
        redList.add(1);
        redList.add(11);
        redList.add(17);
        redList.add(21);
        redList.add(33);
        redList.add(31);
        System.out.println(getLast(redList));
    }
}
