<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<option value="" hidden>Select a District</option>
<c:forEach var="dist" items="${DistList}">
    <option value='${dist.getDistCode()}' <c:if test="${dist.getDistCode() == User.getDistCode()}"> selected </c:if>>${dist.getDistName()} </option>
</c:forEach>