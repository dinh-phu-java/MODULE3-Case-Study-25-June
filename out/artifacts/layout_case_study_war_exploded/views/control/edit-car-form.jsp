<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="content-wrapper">
    <section class="content">
        <ul>
            <c:forEach items="${messages}" var="message">
                <li>${message}</li>
            </c:forEach>
        </ul>
        <form method="post" action="product-controller" enctype="multipart/form-data">
            <input type="hidden" class="form-control" name="action" value="edit-car">
            <input type="hidden" name="editCarId" value="${editCar.car_id}">
            <div class="row">

                <div class="col-md-8">
                    <h2>Add Car</h2>
                    <section>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Engine Type</label>
                                    <select name="engine_type" class="form-control">
                                        <option value="Twin Cylinder">Twin Cylinder</option>
                                        <option value="Three Cylinder">Three Cylinder</option>
                                        <option value="Four Cylinder">Four Cylinder</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Gear Type</label>
                                    <select name="gear" class="form-control">
                                        <option value="mt">MT</option>
                                        <option value="at">AT</option>
                                        <option value="cvt">CVT</option>
                                        <option value="dct">DCT</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Front Wheel</label>
                                    <select name="front-wheel" class="form-control">
                                        <option value="fwd">FWD</option>
                                        <option value="rwd">RWD</option>
                                        <option value="awd">AWD</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Fuel Type</label>
                                    <select name="fuel-type" class="form-control">
                                        <option value="gasoline">Gasoline</option>
                                        <option value="diesel">Diesel</option>
                                        <option value="liquefied">Liquefied</option>
                                        <option value="petroleum">Petroleum</option>
                                        <option value="compressed">Compressed</option>
                                        <option value="natural gas">Natural Gas</option>
                                        <option value="ethanol">Ethanol</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Valves</label>
                                    <select name="valves" class="form-control">
                                        <option value="6 speed">6 Speed</option>
                                        <option value="5 speed">5 Speed</option>
                                        <option value="4 speed">4 Speed</option>

                                    </select>
                                </div>

                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Car Price</label>
                                    <input type="text" class="form-control" name="price" value="${editCar.car_price}" placeholder="Price" required>
                                </div>

                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Date Of Manufacture</label>
                                    <input type="date" name="date_of_manufacture" class="form-control" required>
                                </div>

                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Vendor</label>
                                    <input type="text" name="vendor" value="${editCar.vendor}" class="form-control" required>
                                </div>

                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Car Type</label>
                                    <select name="car_type" class="form-control">
                                        <option value="4 Door Sedans">4-Door Sedans</option>
                                        <option value="2 Door Coupes">2-Door Coupes</option>
                                        <option value="Station Wagons">Liquefied</option>
                                        <option value="Convertibles">Petroleum</option>
                                        <option value="Sports Cars">Sports Cars</option>
                                        <option value="Mini Vans">Mini-Vans</option>
                                        <option value="suvs">SUVs</option>
                                        <option value="Pickup Trucks">Pickup Trucks</option>
                                        <option value="Vans">Vans</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-12">

                                <div class="form-group">
                                    <label>Car Name</label>
                                    <input type="text" name="car_name" value="${editCar.car_name}" class="form-control" required>
                                </div>

                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="exampleInputFile">Image upload</label>
                                    <div class="input-group">
                                        <div class="custom-file">
                                            <input type="file" class="custom-file-input" id="exampleInputFile"
                                                   name="file" required>
                                            <label class="custom-file-label" for="exampleInputFile">Choose file</label>
                                        </div>
                                        <div class="input-group-append">
                                            <span class="input-group-text" id="">Upload</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="card-body pad">
                                    <div class="mb-3">
                                        <textarea name="description" class="textarea" placeholder="Place some text here"
                                                  style="width: 100%; height: 500px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 30px;">
                                            ${editCar.description}
                                        </textarea>
                                    </div>
                                </div>
                            </div>
                            <!--end row-->
                            <!--end form-group-->
                        </div>
                    </section>

                    <section class="clearfix">
                        <button type="submit" class="btn btn-outline-danger float-left">Edit Car</button>
                    </section>

                    <p style="color:green;">${message}</p>
                    <c:if test="${message !=null}">
                        <c:remove var="message"/>
                    </c:if>
                </div>
                <!--end col-md-8-->

            </div>
        </form>
    </section>
</div>