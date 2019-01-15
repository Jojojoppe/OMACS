# OMACS - Online Member And Committee System

OMACS is an online platform which can act as a simple site engine or a member lock. OMACS is mostly written in PHP and is wrapped around UserSpice, a user login framework.

Currently OMACS is still in develompent phase. This means that the versions (v0.x.y) do not have to be stable!

Pages in OMACS are organised in so called 'cards'. A card is a small piece of page which an own header. Users which have permission to change certain pages can access settings of the cards on that page and change their behaviour or content. OMACS is shipped with a few standard card types. OMACS allows for third party card types and provides the OMACS CARDS API (currently APIv2).

##### CARDS APIv2
No documentation yet.

##### Install
Installing OMACS is very simple and can be done via the provided installer. Before installing OMACS one must create a database. The rest of the install procedure is explained in `install/index.php`
