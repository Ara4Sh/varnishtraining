<?php
header('Cache-control: public, s-maxage=100');
header("xkey: a");
header("xkey: b",false);
echo date('Y-m-d H:i:s').'<br />'.PHP_EOL;