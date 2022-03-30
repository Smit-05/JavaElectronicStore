<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="../../resources/header/customerHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>About Us</title>
<svg aria-hidden="true"
	style="position: absolute; width: 0; height: 0; overflow: hidden;"
	version="1.1" xmlns="http://www.w3.org/2000/svg"
	xmlns:xlink="http://www.w3.org/1999/xlink">
    <defs>
        <symbol id="icon-phone" viewBox="0 0 32 32">
            <path
		d="M22 20c-2 2-2 4-4 4s-4-2-6-4-4-4-4-6 2-2 4-4-4-8-6-8-6 6-6 6c0 4 4.109 12.109 8 16s12 8 16 8c0 0 6-4 6-6s-6-8-8-6z"></path>
        </symbol>
        <symbol id="icon-envelop" viewBox="0 0 32 32">
            <path
		d="M29 4h-26c-1.65 0-3 1.35-3 3v20c0 1.65 1.35 3 3 3h26c1.65 0 3-1.35 3-3v-20c0-1.65-1.35-3-3-3zM12.461 17.199l-8.461 6.59v-15.676l8.461 9.086zM5.512 8h20.976l-10.488 7.875-10.488-7.875zM12.79 17.553l3.21 3.447 3.21-3.447 6.58 8.447h-19.579l6.58-8.447zM19.539 17.199l8.461-9.086v15.676l-8.461-6.59z"></path>
        </symbol>
        <symbol id="icon-location2" viewBox="0 0 32 32">
            <path
		d="M16 0c-5.523 0-10 4.477-10 10 0 10 10 22 10 22s10-12 10-22c0-5.523-4.477-10-10-10zM16 16.125c-3.383 0-6.125-2.742-6.125-6.125s2.742-6.125 6.125-6.125 6.125 2.742 6.125 6.125-2.742 6.125-6.125 6.125zM12.125 10c0-2.14 1.735-3.875 3.875-3.875s3.875 1.735 3.875 3.875c0 2.14-1.735 3.875-3.875 3.875s-3.875-1.735-3.875-3.875z"></path>
        </symbol>
    </defs>
</svg>
<style>

/* .foo body {
  padding: 0;
  margin: 0;
  font-family: sans-serif;
  font-size: 1em;
  line-height: 1.5;
  color: #555;
  background: #fff;
} */
.foo h1 {
  font-size: 1.5em;
  font-weight: normal;
  box-shadow: 0 1px #ddd, 0 2px #fff, 0 3px #ddd;
}
.foo small {
  font-size: .66666667em;
}
.foo a {
  color: #e74c3c;
  text-decoration: none;
}
.foo a:hover, a:focus {
  box-shadow: 0 1px #e74c3c;
}
.foo .bshadow0, input {
  box-shadow: inset 0 -2px #e7e7e7;
}
.foo input:hover {
  box-shadow: inset 0 -2px #ccc;
}
.foo input, fieldset {
  font-size: 1em;
  margin: 0;
  padding: 0;
  border: 0;
}
.foo input {
  color: inherit;
  line-height: 1.5;
  height: 1.5em;
  padding: .25em 0;
}
.foo input:focus {
  outline: none;
  box-shadow: inset 0 -2px #449fdb;
}
.foo .glyph {
  font-size: 16px;
  margin-right: 1.5em;
  float: left;
  width: 6em;
}
.foo svg {
  color: #000;
}
.foo .liga {
  width: 80%;
  width: calc(100% - 2.5em);
}
.foo .talign-right {
  text-align: right;
}
.foo .talign-center {
  text-align: center;
}
.foo .bgc1 {
  background: #f1f1f1;
}
.foo .fgc0 {
  color: #000;
}
.foo .fgc1 {
  color: #999;
}
.foo p {
  margin-top: 1em;
  margin-bottom: 1em;
}
.foo .mvm {
  margin-top: .75em;
  margin-bottom: .75em;
}
.foo .mtn {
  margin-top: 0;
}
.foo .mtl, .mal {
  margin-top: 1.5em;
}
.foo .mbl, .mal {
  margin-bottom: 1.5em;
}
.foo .mal, .mhl {
  margin-left: 1.5em;
  margin-right: 1.5em;
}
.foo .mhmm {
  margin-left: 1em;
  margin-right: 1em;
}
.foo .ptl {
  padding-top: 1.5em;
}
.foo .pbs, .pvs {
  padding-bottom: .25em;
}
.foo .pvs, .pts {
  padding-top: .25em;
}
.foo .unit {
  float: left;
}
.foo .unitRight {
  float: right;
}
.foo .size1of2 {
  width: 50%;
}
.foo .size1of1 {
  width: 100%;
}
.foo .clearfix:before, .clearfix:after {
  content: " ";
  display: table;
}
.foo .clearfix:after {
  clear: both;
}
.foo .hidden-true {
  display: none;
}
.foo .textbox0 {
  width: 3em;
  background: #f1f1f1;
  padding: .25em .5em;
  line-height: 1.5;
  height: 1.5em;
}
.foo .fs0 {
  font-size: 16px;
}
.foo .fs1 {
  font-size: 24px;
}
.foo .name {
  font-size: 0.5em;
  margin-left: 1em;
}


/* main icon styles */


.icon {
  display: inline-block;
  width: 1em;
  height: 1em;
  stroke-width: 0;
  stroke: currentColor;
  fill: currentColor;
}

/* ========================================== */
/* Single-colored icons can be modified like so: */
/* .icon-user-x {
  font-size: 32px;
  color: tomato;
} */
/* ========================================== */



</style>
</head>
<body class="d-flex flex-column min-vh-100">
	<main class="container mt-3 col-xl-6">
		<section class="mb-4">
			<h2 class="h1-responsive font-weight-bold text-center my-4">About
				Us</h2>
			<p class="text-center w-responsive mx-auto mb-5">Do you have any
				questions? Please do not hesitate to contact us directly. Our team
				will come back to you within amatter of hours to help you.</p>

			<div class="row">
				<div class="col">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title text-center display-6 addresscard">
								<svg class="icon icon-location2">
                                    <use xlink:href="#icon-location2"></use>
                                </svg>
							</h5>
							<p class="card-text text-center">
								<span class="name">College Road, Nadiad 387 001, Gujarat, India.</span>
							</p>
						</div>
					</div>
				</div>

				<div class="col">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title text-center display-6 addresscard">
								<svg class="icon icon-envelop">
                                    <use xlink:href="#icon-envelop"></use>
                                </svg>
							</h5>
							<br>

							<p class="card-text text-center">
								<span class="name">ddu_electonics@gmail.com</span>
							</p>
						</div>
					</div>
				</div>

				<div class="col">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title text-center display-6 addresscard">
								<svg class="icon icon-phone">
                                    <use xlink:href="#icon-phone"></use>
                                </svg>
							</h5>
							<br>
							<p class="card-text text-center">
								<span class="name">+91 9999900000</span>
							</p>
						</div>
					</div>
				</div>
			</div>

		</section>
	</main>
	<div class="mt-auto">
	<%@include file="../../resources/header/footer.jsp"%>	
	</div>
</body>
</html>