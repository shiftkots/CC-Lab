<?php
/**
 * The home page of a registered user
 *
 * If a user’s login credentials have been verified by the logic in
 * “login.php,” then $_SESSION['valid'] is set to true and the user is redirected
 * here. If $_SESSION['valid'] is not true, then the user is redirected to the index
 * page.
 *
 * A valid user can upload files using the form on this page, and see the files
 * she/he has uploaded.
 *
 * PHP version 5.3.28
 *
 * @category Web_App
 * @package  Web_App
 * @author   Roy A Vanegas <roy@thecodeeducators.com>
 * @license  https://gnu.org/licenses/gpl.html GNU General Public License
 * @link     https://bitbucket.org/code-warrior/web-app/
 */

session_start();

if (isset($_SESSION['valid'])) {
    if ($_SESSION['valid'] !== true) {
        header("Location: ./index.php");
    }
} else {
    header("Location: ./index.php");
}

require_once "includes/db.php";
require_once "includes/main.php";

$username = select("username", "user", "username", $_SESSION['username']);

$links = getAllFileLinksFor($_SESSION['username']);

$amount_of_links = count($links);

?>
<!DOCTYPE HTML>
<html>
   <head>
      <meta charset="utf-8">
      <title>HAPPY_CITY_HOME</title>
      <link rel="stylesheet"
            href="css/normalize.css">
      <link rel="stylesheet" href="css/inStyle.css">
      <link rel="stylesheet"
            href="css/style.css">
      <link rel="stylesheet"
            href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
   </head>
   <body>

    <div class="weatherWidget">

          <div class="currentWeather">
            
            <div class="text">
              <div class="temperature">
              </div>
        
              <div class="weather">
              </div>
            </div>

          </div>

        </div>
      <header>
        <p class="hello">hello, <strong><?php echo $username; ?></strong>. keep happy!</p>
      </header>

  <div class="city">
    <img src="images/City.gif" />
  </div>
  <div class="cloud1"></div>
  <div class="cloud2"></div>
  <div class="cloud3"></div>
  <div class="sun"></div>

  <div class="input">
    <form class="currentLocation">
      <input type="text" class="searchCity" value="City, Country" onfocus="this.value=''">

      <input type="image" src="images/icon-03.png" id="submit">
    </form>
  </div>
  
  <div class="logout">  
  <p><a href="./logout.php">Logout</a></p>
  </div>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="js/jquery-ui.js"></script>
  <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&libraries=places&language=en-AU"></script>
  <script src="js/main.js"></script>
   </body>
</html>
