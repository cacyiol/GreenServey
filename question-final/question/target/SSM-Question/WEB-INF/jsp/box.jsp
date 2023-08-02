%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--  <head>--%>
<%--    <title>Title</title>--%>
<%--  </head>--%>
<%--  <body style="margin: 30px;">--%>
<%--    <h1>弹性盒子模型测试</h1>--%>
<%--    <br>--%>
<%--    <h3>1、div默认垂直排列</h3>--%>
<%--    <div style="height: 220px;background-color: #d0d0d0">--%>
<%--      <div style="background-color: #00a2d4;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">1--%>
<%--      </div>--%>
<%--      <div style="background-color: red;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">2--%>
<%--      </div>--%>
<%--      <div style="background-color: #5FB878;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">--%>
<%--        3--%>
<%--      </div>--%>
<%--      <div style="background-color: rebeccapurple;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">--%>
<%--        4--%>
<%--      </div>--%>
<%--    </div>--%>
<%--    <br>--%>
<%--    <h3>2、div变成弹性盒子模型(display: flex;)，子元素将横向排列</h3>--%>
<%--    <div style="height: 220px;background-color: #d0d0d0;display: flex;">--%>
<%--      <div style="background-color: #00a2d4;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">1--%>
<%--      </div>--%>
<%--      <div style="background-color: red;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">2--%>
<%--      </div>--%>
<%--      <div style="background-color: #5FB878;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">--%>
<%--        3--%>
<%--      </div>--%>
<%--      <div style="background-color: rebeccapurple;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">--%>
<%--        4--%>
<%--      </div>--%>
<%--    </div>--%>

<%--    <h3>3、div变成弹性盒子模型(display: flex;)，子元素默认横向排列(flex-direction: row;)</h3>--%>
<%--    <div style="height: 220px;background-color: #d0d0d0;display: flex;flex-direction: row;">--%>
<%--      <div style="background-color: #00a2d4;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">1--%>
<%--      </div>--%>
<%--      <div style="background-color: red;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">2--%>
<%--      </div>--%>
<%--      <div style="background-color: #5FB878;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">--%>
<%--        3--%>
<%--      </div>--%>
<%--      <div style="background-color: rebeccapurple;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">--%>
<%--        4--%>
<%--      </div>--%>
<%--    </div>--%>
<%--    <h3>4、div变成弹性盒子模型(display: flex;)，子元素纵向排列(flex-direction: column;)</h3>--%>
<%--    <div style="height: 220px;background-color: #d0d0d0;display: flex;flex-direction: column;">--%>
<%--      <div style="background-color: #00a2d4;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">1--%>
<%--      </div>--%>
<%--      <div style="background-color: red;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">2--%>
<%--      </div>--%>
<%--      <div style="background-color: #5FB878;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">--%>
<%--        3--%>
<%--      </div>--%>
<%--      <div style="background-color: rebeccapurple;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">--%>
<%--        4--%>
<%--      </div>--%>
<%--    </div>--%>
<%--    <h3>5、div变成弹性盒子模型(display: flex;)，子元素水平反方向排列(flex-direction: row-reverse;)</h3>--%>
<%--    <div style="height: 220px;background-color: #d0d0d0;display: flex;flex-direction: row-reverse;">--%>
<%--      <div style="background-color: #00a2d4;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">1--%>
<%--      </div>--%>
<%--      <div style="background-color: red;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">2--%>
<%--      </div>--%>
<%--      <div style="background-color: #5FB878;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">--%>
<%--        3--%>
<%--      </div>--%>
<%--      <div style="background-color: rebeccapurple;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">--%>
<%--        4--%>
<%--      </div>--%>
<%--    </div>--%>
<%--    <h3>6、div变成弹性盒子模型(display: flex;)，子元素纵向反方向排列(flex-direction: column-reverse;)</h3>--%>
<%--    <div style="height: 220px;background-color: #d0d0d0;display: flex;flex-direction: column-reverse;">--%>
<%--      <div style="background-color: #00a2d4;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">1--%>
<%--      </div>--%>
<%--      <div style="background-color: red;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">2--%>
<%--      </div>--%>
<%--      <div style="background-color: #5FB878;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">--%>
<%--        3--%>
<%--      </div>--%>
<%--      <div style="background-color: rebeccapurple;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">--%>
<%--        4--%>
<%--      </div>--%>
<%--    </div>--%>
<%--    <h3>6、div变成弹性盒子模型(display: flex;)，子元素主轴对齐方式：(justify-content: flex-start)左对齐</h3>--%>
<%--    <div style="height: 220px;background-color: #d0d0d0;display: flex;justify-content: flex-start">--%>
<%--      <div style="background-color: #00a2d4;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">1--%>
<%--      </div>--%>
<%--      <div style="background-color: red;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">2--%>
<%--      </div>--%>
<%--      <div style="background-color: #5FB878;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">--%>
<%--        3--%>
<%--      </div>--%>
<%--      <div style="background-color: rebeccapurple;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">--%>
<%--        4--%>
<%--      </div>--%>
<%--    </div>--%>
<%--    <h3>7、div变成弹性盒子模型(display: flex;)，子元素主轴对齐方式：(justify-content: center)居中对齐</h3>--%>
<%--    <div style="height: 220px;background-color: #d0d0d0;display: flex;justify-content: center">--%>
<%--      <div style="background-color: #00a2d4;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">1--%>
<%--      </div>--%>
<%--      <div style="background-color: red;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">2--%>
<%--      </div>--%>
<%--      <div style="background-color: #5FB878;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">--%>
<%--        3--%>
<%--      </div>--%>
<%--      <div style="background-color: rebeccapurple;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">--%>
<%--        4--%>
<%--      </div>--%>
<%--    </div>--%>
<%--    <h3>8、div变成弹性盒子模型(display: flex;)，子元素主轴对齐方式：(justify-content: flex-end)右对齐</h3>--%>
<%--    <div style="height: 220px;background-color: #d0d0d0;display: flex;justify-content: flex-end">--%>
<%--      <div style="background-color: #00a2d4;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">1--%>
<%--      </div>--%>
<%--      <div style="background-color: red;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">2--%>
<%--      </div>--%>
<%--      <div style="background-color: #5FB878;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">--%>
<%--        3--%>
<%--      </div>--%>
<%--      <div style="background-color: rebeccapurple;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">--%>
<%--        4--%>
<%--      </div>--%>
<%--    </div>--%>
<%--    <h3>9、div变成弹性盒子模型(display: flex;)，子元素交叉轴对齐方式：(align-items: flex-end)上对齐</h3>--%>
<%--    <div style="height: 200px;background-color: #d0d0d0;display: flex;align-items: flex-start">--%>
<%--      <div style="background-color: #00a2d4;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">1--%>
<%--      </div>--%>
<%--      <div style="background-color: red;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">2--%>
<%--      </div>--%>
<%--      <div style="background-color: #5FB878;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">--%>
<%--        3--%>
<%--      </div>--%>
<%--      <div style="background-color: rebeccapurple;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">--%>
<%--        4--%>
<%--      </div>--%>
<%--    </div>--%>
<%--    <h3>10、div变成弹性盒子模型(display: flex;)，子元素交叉轴对齐方式：(align-items: center)居中对齐</h3>--%>
<%--    <div style="height: 200px;background-color: #d0d0d0;display: flex;align-items: center">--%>
<%--      <div style="background-color: #00a2d4;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">1--%>
<%--      </div>--%>
<%--      <div style="background-color: red;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">2--%>
<%--      </div>--%>
<%--      <div style="background-color: #5FB878;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">--%>
<%--        3--%>
<%--      </div>--%>
<%--      <div style="background-color: rebeccapurple;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">--%>
<%--        4--%>
<%--      </div>--%>
<%--    </div>--%>
<%--    <h3>11、div变成弹性盒子模型(display: flex;)，子元素交叉轴对齐方式：(align-items: flex-end)底部对齐</h3>--%>
<%--    <div style="height: 200px;background-color: #d0d0d0;display: flex;align-items: flex-end">--%>
<%--      <div style="background-color: #00a2d4;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">1--%>
<%--      </div>--%>
<%--      <div style="background-color: red;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">2--%>
<%--      </div>--%>
<%--      <div style="background-color: #5FB878;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">--%>
<%--        3--%>
<%--      </div>--%>
<%--      <div style="background-color: rebeccapurple;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">--%>
<%--        4--%>
<%--      </div>--%>
<%--    </div>--%>
<%--    <h3>12、div变成弹性盒子模型(display: flex;)，子元素水平和垂直居中对齐</h3>--%>
<%--    <div style="height: 200px;background-color: #d0d0d0;display: flex;align-items: center;justify-content: center;">--%>
<%--      <div style="background-color: #00a2d4;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">1--%>
<%--      </div>--%>
<%--      <div style="background-color: red;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">2--%>
<%--      </div>--%>
<%--      <div style="background-color: #5FB878;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">--%>
<%--        3--%>
<%--      </div>--%>
<%--      <div style="background-color: rebeccapurple;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">--%>
<%--        4--%>
<%--      </div>--%>
<%--    </div>--%>
<%--    <h3>13、div变成弹性盒子模型(display: flex;)，justify-content: space-around;</h3>--%>
<%--    <div style="height: 200px;background-color: #d0d0d0;display: flex;justify-content: space-around;">--%>
<%--      <div style="background-color: #00a2d4;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">1--%>
<%--      </div>--%>
<%--      <div style="background-color: red;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">2--%>
<%--      </div>--%>
<%--      <div style="background-color: #5FB878;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">--%>
<%--        3--%>
<%--      </div>--%>
<%--      <div style="background-color: rebeccapurple;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">--%>
<%--        4--%>
<%--      </div>--%>
<%--    </div>--%>
<%--    <h3>14、div变成弹性盒子模型(display: flex;)，justify-content: space-between;</h3>--%>
<%--    <div style="height: 200px;background-color: #d0d0d0;display: flex;justify-content: space-between;">--%>
<%--      <div style="background-color: #00a2d4;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">1--%>
<%--      </div>--%>
<%--      <div style="background-color: red;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">2--%>
<%--      </div>--%>
<%--      <div style="background-color: #5FB878;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">--%>
<%--        3--%>
<%--      </div>--%>
<%--      <div style="background-color: rebeccapurple;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">--%>
<%--        4--%>
<%--      </div>--%>
<%--    </div>--%>
<%--  </body>--%>
<%--</html>--%>
