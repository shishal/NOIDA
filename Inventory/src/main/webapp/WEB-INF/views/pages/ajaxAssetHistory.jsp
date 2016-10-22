<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="modal-dialog">
	<div class="modal-content" style="width:125%">
		<div class="modal-header app-modal-header">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h4 class="modal-title">Asset Assignment History</h4>
		</div>
		<!-- Modal Body -->
		<div class="modal-body app-modal-content bg-alt">
			<div class="table-responsive">
				<table class="table table-bordered" id="assetTable">
					<thead class="thead-inverse table-header" style="">
						<tr>
							<th>#</th>
							<th>Sub type</th>
							<th>Asset Type</th>
							<th>Request Id</th>
							<th>Issue Date</th>
							<th>Issued To</th>
							<th>Description</th>
							<th>Return date</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${assetHistory}" var="issue" varStatus="row">
					<tr>
						<td scope="row">${row.index +1}</td>
							<td>${issue.asset.assetSubType.subType}</td>
							<td>${issue.asset.assetMainType.mainType}</td>
							<td>${issue.request.id}</td>
							<td><fmt:formatDate type="date"  value="${issue.issueDate}" pattern="dd-MM-yyyy" /></td>
							<td>${issue.issuedTo.username}</td>
							<td>${issue.description}</td>
							<td><fmt:formatDate type="date"  value="${issue.returnDate}" pattern="dd-MM-yyyy" /></td>
					</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
