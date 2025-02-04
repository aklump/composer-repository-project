<?php
/** @var string $path */
if (!file_exists(__DIR__ . '/../inc/_bootstrap.php')) {
  echo PHP_EOL;
  echo "❌ Not built; try `bump build`." . PHP_EOL;
  echo PHP_EOL;
  exit(1);
}
require_once __DIR__ . '/../inc/_bootstrap.php';

$path = preg_replace('#^' . ROOT . '#', FRAMEWORK_DIR, $path);
require_once $path;
