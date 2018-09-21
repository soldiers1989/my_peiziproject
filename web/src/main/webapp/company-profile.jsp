<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="header.jsp"%>
  <div class="container clearfix sub-page">
    <div class="sub-side fl">
      <ul>
        <li class="active">
          <a href="./company-profile.jsp">公司简介</a>
        </li>
        <li>
          <a href="./contact-us.jsp">联系我们</a>
        </li>
      </ul>
    </div>
    <div class="sub-main fl">
      <div class="title">公司简介</div>
      <div class="content">
         <p>&#12288;&#12288;98配资网（www.98peizi.com）隶属于中期华泰（北京）科技有限公司，注册资本500万人民币。十年期货配资老品牌，可能是中国最好的期货配资网站。公司长期经营商品期货、股指期货、原油期货配资、咨询等相关业务。公司现拥有一支在投资市场历练多年，具有深厚功底的操盘手和专业的风控队伍。我们坚持“客户至上、诚信为本”的经营理念，在期货配资等行业中稳扎稳打，稳健经营；坚持“与客户共赢”的发展战略，不断为客户创造价值。98配资网依托股东丰厚的资金支持，与各大银行、信托公司、基金公司、期货公司、证券公司等机构建立长期的战略合作关系。同时也竭诚欢迎有实力的机构和个人就资金等方面进行协商与合作，共创财富！</p>
      </div>
    </div>
  </div>
 <%@include file="footer.jsp"%> 
  <script src="<%=basePath%>/js/libs/require.min.js"></script>
  <script>
    require(['js/company-profile.js'])
  </script>