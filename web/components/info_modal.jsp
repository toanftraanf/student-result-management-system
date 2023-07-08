<%-- 
    Document   : info_modal
    Created on : Jul 9, 2023, 1:09:06 AM
    Author     : trant
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="modal fade" id="infoModal${c.students.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Student's Information</h5>
                                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-6 ml-auto">Roll ID: </div>
                                    <div class="col-md-6 ml-auto">${c.students.rollId}</div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 ml-auto">Name: </div>
                                    <div class="col-md-6 ml-auto">${c.students.name}</div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 ml-auto">Date of Birth: </div>
                                    <div class="col-md-6 ml-auto">${c.students.dob}</div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 ml-auto">Gender: </div>
                                    <div class="col-md-6 ml-auto">${c.students.sex == 1 ? "Male" : "Female"}</div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 ml-auto">Address: </div>
                                    <div class="col-md-6 ml-auto">${c.students.address}</div>
                                </div> 
                                <div class="row">
                                    <div class="col-md-6 ml-auto">Class: </div>
                                    <div class="col-md-6 ml-auto">${c.students.classes.name}</div>
                                </div> 
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
