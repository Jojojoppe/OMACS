<?php include("sniplets/header.php"); ?>

<div class="wrapper">

	<!-- Sidebar Holder -->
	<nav id="sidebar">
		<div id="dismiss" class="d-md-none">
			<i class="fa fa-angle-double-left"></i>
		</div>

		<div class="sidebar-header">
			<h3>ONLINE MEMBER AND COMMITTEE SYSTEM</h3>
		</div>

		<ul class="list-unstyled components">

			<?php include("sniplets/menu.php"); ?>

			<div class="copyright">
				<a href="?viewna=copyright">&copy;2019 Joppe Blondel | All rights reserved<a>
			</div>
	</nav>

	<!-- Page Content Holder -->
	<div id="content">

		<nav class="navbar navbar-default d-md-none">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" id="sidebarCollapse" class="btn btn-info navbar-btn">
						<i class="fa fa-bars"></i>
						MENU
					</button>
				</div>
				<a href="<?=$us_url_root?>"><b>OMACS</b></a>
			</div>
		</nav>

		<?php include("sniplets/page.php"); ?>

	</div>
</div>

<?php include("sniplets/footer.php"); ?>
