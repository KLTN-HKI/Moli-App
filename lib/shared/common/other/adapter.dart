bool fromIntegerToBoolean(int num) {
  switch (num) {
    case 1:
      return true;
    default:
      return false;
  }
}

int fromBooleabToInteger(bool? bool) {
  switch (bool) {
    case true:
      return 1;
    default:
      return 0;
  }
}
