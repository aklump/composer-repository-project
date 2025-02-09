<?php
# Bootstrap
/** @var string $path */
if (!file_exists(__DIR__ . '/../inc/_bootstrap.php')) {
  echo PHP_EOL;
  echo "❌ Not built; try `bump build`." . PHP_EOL;
  echo PHP_EOL;
  exit(1);
}
require_once __DIR__ . '/../inc/_bootstrap.php';

# Manipulate the path for the framework
$path = preg_replace('#^' . ROOT . '#', FRAMEWORK_DIR, $path);
if (!pathinfo($path, PATHINFO_EXTENSION)) {
  $path .= '.php';
}

# Check for then execute the framework file
if (!file_exists($path)) {
  echo PHP_EOL;
  echo "❌ Missing framework; try \`composer install\`.";
  echo PHP_EOL;
  exit(1);
}
require $path;
