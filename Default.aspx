<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Myweb.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>天眼Y-焦点事件速递</title>
    <!-- 网站ico -->
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
    <!-- css初始化文件 -->
    <link rel="stylesheet" href="css/Normalize.css"/>
    <!-- 公共的css样式 -->
    <link rel="stylesheet" href="css/base.css"/>
    <!-- 首页的css样式 -->
    <link rel="stylesheet" href="css/index.css" />
</head>

<body>
    <!-- 页面头部分 -->
    <div class="header" runat="server">
        <div class="w" runat="server">
            <div class="header-l fl">
                <a href="NewsData.aspx?newsid=31"><asp:Image ID="Headlines" runat="server" ImageUrl="~/images/Headlines_02.png" Height="450px"/></a>              
            </div>
            <div class="header-r fr">
                <a href="NewsData.aspx?newsid=31"><h1>今日头条</h1></a>
                <a href="NewsData.aspx?newsid=31"><p>五档！动物系人人果实尼卡形态！</p></a>
            </div>
        </div>
    </div>
    <!-- 中间头部分 -->
    <div class="middle" runat="server">
        <div class="nav clearfix w"  runat="server">
            <!-- logo部分 -->
            <div class="logo fl">
                <a href="Default.aspx">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/logo_03.png" />
                </a>
            </div>
            <!-- 导航栏部分 -->
            <div class="navbar fl">
                <ul>
                    <li>
                        <asp:HyperLink ID="Home" runat="server" NavigateUrl="~/Default.aspx"><span>首页</span></asp:HyperLink>
                    </li>
                    <li>
                        <asp:HyperLink ID="News" runat="server" NavigateUrl="~/Manager/AddNews.aspx"><span>发布新闻</span></asp:HyperLink>
                    </li>
                    <li>
                        <asp:HyperLink ID="Manager" runat="server" NavigateUrl="~/Manager/Login.aspx"><span>管理新闻</span></asp:HyperLink>
                    </li>
                    <li>
                        <asp:HyperLink ID="Personal" runat="server" NavigateUrl="~/Stationmaster.aspx"><span>关于站长</span></asp:HyperLink>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- 中间主体部分 -->
    <div class="w major clearfix" runat="server">
        <div class="top clearfix">
            <div class="d fl">
                <asp:Label ID="Label1" runat="server" Text="时事新闻"></asp:Label>
                <div class="limit">
                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                        <ItemTemplate>
                            <div class="news_main clearfix">
                                <a href="NewsData.aspx?newsid=<%# Eval("NewsID") %>"><%# Eval("NewsTitle") %></a>
                                <asp:Label ID="NewsDateLabel1" runat="server" Text='<%# Eval("NewsDate") %>' />
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NewsConnectionString %>" SelectCommand="SELECT [NewsID], [NewsTitle], [NewsDate] FROM [NewsInfo] WHERE NewsCategory='时事新闻'"></asp:SqlDataSource>
                </div>
                <asp:HyperLink ID="HyperLink1" CssClass="more" runat="server" NavigateUrl="~/NewsList.aspx?category=时事新闻">浏览更多<i>焦点新闻>>></i></asp:HyperLink>
            </div>
            <div class="d fr">
                <asp:Label ID="Label2" runat="server" Text="娱乐新闻"></asp:Label>
                <div class="limit">
                    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
                        <ItemTemplate>
                            <div class="news_main clearfix">
                                <a href="NewsData.aspx?newsid=<%# Eval("NewsID") %>"><%# Eval("NewsTitle") %></a>
                                <asp:Label ID="NewsDateLabel1" runat="server" Text='<%# Eval("NewsDate") %>' />
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:NewsConnectionString %>" SelectCommand="SELECT [NewsID], [NewsTitle], [NewsDate] FROM [NewsInfo] WHERE NewsCategory='娱乐新闻' AND [NewsID] != 31"></asp:SqlDataSource>
                </div>
                <asp:HyperLink ID="HyperLink2" CssClass="more" runat="server" NavigateUrl="~/NewsList.aspx?category=娱乐新闻">浏览更多<i>焦点新闻>>></i></asp:HyperLink>
            </div>
        </div>
        <div class="bottom clearfix">
            <div class="d fl">
                <asp:Label ID="Label3" runat="server" Text="财经新闻"></asp:Label>
                <div class="limit">
                    <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource3">
                        <ItemTemplate>
                            <div class="news_main clearfix">
                                <a href="NewsData.aspx?newsid=<%# Eval("NewsID") %>"><%# Eval("NewsTitle") %></a>
                                <asp:Label ID="NewsDateLabel1" runat="server" Text='<%# Eval("NewsDate") %>' />
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:NewsConnectionString %>" SelectCommand="SELECT [NewsID], [NewsTitle], [NewsDate] FROM [NewsInfo] WHERE NewsCategory='财经新闻'"></asp:SqlDataSource>
                <asp:HyperLink ID="HyperLink3" CssClass="more" runat="server" NavigateUrl="~/NewsList.aspx?category=财经新闻">浏览更多<i>焦点新闻>>></i></asp:HyperLink>
            </div>
            <div class="d fr">
                <asp:Label ID="Label4" runat="server" Text="体育新闻"></asp:Label>
                <div class="limit">
                    <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource4">
                        <ItemTemplate>
                            <div class="news_main clearfix">
                                <a href="NewsData.aspx?newsid=<%# Eval("NewsID") %>"><%# Eval("NewsTitle") %></a>
                                <asp:Label ID="NewsDateLabel1" runat="server" Text='<%# Eval("NewsDate") %>' />
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:NewsConnectionString %>" SelectCommand="SELECT [NewsID], [NewsTitle], [NewsDate] FROM [NewsInfo] WHERE NewsCategory='体育新闻'"></asp:SqlDataSource>
                <asp:HyperLink ID="HyperLink4" CssClass="more" runat="server" NavigateUrl="~/NewsList.aspx?category=体育新闻">浏览更多<i>焦点新闻>>></i></asp:HyperLink>
            </div>
        </div>
    </div>
    <!-- 页面底部分 -->
    <div class="footer" runat="server">
        <div class="footer-in w">
            <h1>其他网站</h1>
            <p class="othernet">
                <a href="https://cn.bing.com/?scope=web&FORM=ANNTH1">必应</a>
                <a href="https://www.baidu.com/?tn=02003390_30_hao_pghttps://www.baidu.com/?tn=02003390_30_hao_pg">百度</a>
                <a href="https://vip.iqiyi.com/cps_pc.html">爱奇艺</a>
                <a href="https://www.mgtv.com/">芒果TV</a>
                <a href="https://www.suning.com/?utm_source=union&utm_medium=005007&adtype=5&utm_campaign=05946b19-7c4f-4443-b244-f1e37a23abbc&union_place=un">苏宁易购</a>
                <a href="https://www.msn.cn/zh-cn/lifestyle/shopping?ocid=msedgntp&cvid=2106713fc5ba43e29da7323af979881d">精选购物</a>
                <a href="https://tv.cctv.com/">CCTV</a>
                <a href="https://pages.tmall.com/wow/z/cs/act/wupr?wh_biz=tm&wh_pid=act%2Ftaokechengjie&ali_trackid=2:mm_1183900030_1813100136_110592400466:1652539528_078_1000156018&union_lens=lensId:OPT@1605248376@0bba6580_e459_175c0425fa9_4681@01;eventPageId:1586925572118;recoveryid:1652539528_078_1000156018&bxsign=tbkD7h3X8wzgVRh1OTmdJZONQCOsFcXMK1ccdlt6zI5/OzI77FFr0azst/1Dh91W9umglfxBkG+fu+pJknlCvwB8gGczvtxhl1LCeN9MnxGBpg=">天猫</a>
                <a href="https://www.taobao.com/">淘宝</a>
                <a href="https://www.jd.com/?cu=true&utm_source=c.mktdatatech.com&utm_medium=tuiguang&utm_campaign=t_16282_172613369&utm_term=b44015abbfe64f178dd3285a545224b2">京东</a>
                <a href="https://ms.vipstatic.com/union/deeplink/deeplink.html?link_url=vipshop%3A%2F%2FgoHome%3Ftra_from%3Dtra%3AC01V0000kve7p4us%3A%40_%401652539633245%3Amig_code%3A224842_168_0_QW5haGVpbVJNLXdlaXBpbmh1aQ%3D%3D_1%3A23939a8d04024296b4735f9ae37b39b9&dest_url=http%3A%2F%2Fwww.vip.com%2F">唯品会</a>
                <a href="https://www.xiaomiyoupin.com/">小米有品</a>
                <a href="https://hd.oppo.com/act/m/2021/CPS/index.html?title=title&utm_source=duomai&utm_medium=191943086">欢太商城</a>
                <a href="http://www.people.com.cn/">人民网</a>
                <a href="http://www.xinhuanet.com/">新华网</a>
            </p>
            <p>@ 2022年YJY Inc.保留所有权利。-19物联网工程有限公司</p>
        </div>
    </div>
</body>
</html>
