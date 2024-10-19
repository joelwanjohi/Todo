import 'package:flutter/material.dart';


Signal<bool> sIsDark = signal<bool>(false);

Signal<bool> sIsGreen = signal<bool>(true);

Computed<FlexScheme> cFlexScheme =  computed(() {
  return sIsGreen.value ? FlexScheme.money : FlexScheme.espresso;
});