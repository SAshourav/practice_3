//ValueNotifier : hold the data
//ValueListenableBuilder : listen to the data (don't need setstate)

import 'package:flutter/cupertino.dart';

ValueNotifier<int> selectedPageNotifier = ValueNotifier(0);
ValueNotifier<bool> isDarkNotifier = ValueNotifier(true);