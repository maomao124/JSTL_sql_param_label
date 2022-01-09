package mao.jstl_sql_param_label;

import java.util.Random;

/**
 * Project name(项目名称)：JSTL_sql_param_label
 * Package(包名): mao.jstl_sql_param_label
 * Class(类名): rad
 * Author(作者）: mao
 * Author QQ：1296193245
 * GitHub：https://github.com/maomao124/
 * Date(创建日期)： 2022/1/9
 * Time(创建时间)： 19:47
 * Version(版本): 1.0
 * Description(描述)： 无
 */

public class rad
{
    public static int getIntRandom(int min, int max)         //空间复杂度和时间复杂度更低
    {
        if (min > max)
        {
            min = max;
        }
        return min + (int) (Math.random() * (max - min + 1));
    }

    public static int getIntRandom1(int min, int max)          //获取int型的随机数
    {
        if (min > max)
        {
            min = max;
        }
        Random random = new Random();
        return random.nextInt(max - min + 1) + min;
    }
}
