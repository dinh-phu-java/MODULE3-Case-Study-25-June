<form class="hero-form form" method="get" action="home">
<input type="hidden" name="action" value="search-post">
    <input type="hidden" name="page" value="1">
    <div class="container">
        <!--Main Form-->
        <div class="main-search-form">
            <div class="form-row">
                <div class="col-md-3 col-sm-3">
                    <div class="form-group">
                        <label for="what" class="col-form-label">Car Name</label>
                        <input name="car_name" type="text" class="form-control" id="what" placeholder="What are you looking for?">
                    </div>
                    <!--end form-group-->
                </div>
                <!--end col-md-3-->
                <div class="col-md-3 col-sm-3">
                    <div class="form-group">
                        <label for="input-location" class="col-form-label">Where?</label>
                        <input name="location" type="text" class="form-control" id="input-location" placeholder="Enter Location">

                    </div>
                    <!--end form-group-->
                </div>
                <!--end col-md-3-->
                <div class="col-md-3 col-sm-3">
                    <div class="form-group">
                        <label for="category" class="col-form-label">Category?</label>
                        <select name="car_type" id="category" data-placeholder="Select Car Type">
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
                    <!--end form-group-->
                </div>
                <!--end col-md-3-->
                <div class="col-md-3 col-sm-3">
                    <button type="submit" class="btn btn-primary width-100">Search</button>
                </div>
                <!--end col-md-3-->
            </div>
            <!--end form-row-->
        </div>
        <!--end main-search-form-->
        <!--Alternative Form-->
        <div class="alternative-search-form">
            <a href="#collapseAlternativeSearchForm" class="icon" data-toggle="collapse"  aria-expanded="false" aria-controls="collapseAlternativeSearchForm"><i class="fa fa-plus"></i>More Options</a>
            <div class="collapse" id="collapseAlternativeSearchForm">
                <div class="wrapper">
                    <div class="form-row">
                        <div class="col-xl-6 col-lg-12 col-md-12 col-sm-12 d-xs-grid d-flex align-items-center justify-content-between">
                            <label>
                                <input type="checkbox" >
                                New
                            </label>
                            <label>
                                <input type="checkbox" >
                                Used
                            </label>
                            <label>
                                <input type="checkbox" >
                                With Photo
                            </label>
                            <label>
                                <input type="checkbox" >
                                Featured
                            </label>
                        </div>
                        <!--end col-xl-6-->
                        <div class="col-xl-6 col-lg-12 col-md-12 col-sm-12">
                            <div class="form-row">
                                <div class="col-md-4 col-sm-4">
                                    <div class="form-group">
                                        <input  type="text" class="form-control small" id="min-price" placeholder="Minimal Price">
                                        <span class="input-group-addon small">$</span>
                                    </div>
                                    <!--end form-group-->
                                </div>
                                <!--end col-md-4-->
                                <div class="col-md-4 col-sm-4">
                                    <div class="form-group">
                                        <input  type="text" class="form-control small" id="max-price" placeholder="Maximal Price">
                                        <span class="input-group-addon small">$</span>
                                    </div>
                                    <!--end form-group-->
                                </div>
                                <!--end col-md-4-->
                                <div class="col-md-4 col-sm-4">
                                    <div class="form-group">
                                        <select  id="distance" class="small" data-placeholder="Distance" >
                                            <option value="">Distance</option>
                                            <option value="1">1km</option>
                                            <option value="2">5km</option>
                                            <option value="3">10km</option>
                                            <option value="4">50km</option>
                                            <option value="5">100km</option>
                                        </select>
                                    </div>
                                    <!--end form-group-->
                                </div>
                                <!--end col-md-3-->
                            </div>
                            <!--end form-row-->
                        </div>
                        <!--end col-xl-6-->
                    </div>
                    <!--end row-->
                </div>
                <!--end wrapper-->
            </div>
            <!--end collapse-->
        </div>
        <!--end alternative-search-form-->
    </div>
    <!--end container-->
</form>