; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -instsimplify -S | FileCheck %s

define i32 @negate_nuw(i32 %x) {
; CHECK-LABEL: @negate_nuw(
; CHECK-NEXT:    ret i32 0
;
  %neg = sub nuw i32 0, %x
  ret i32 %neg
}

define <2 x i32> @negate_nuw_vec(<2 x i32> %x) {
; CHECK-LABEL: @negate_nuw_vec(
; CHECK-NEXT:    ret <2 x i32> zeroinitializer
;
  %neg = sub nuw <2 x i32> zeroinitializer, %x
  ret <2 x i32> %neg
}

define i8 @negate_zero_or_minsigned_nsw(i8 %x) {
; CHECK-LABEL: @negate_zero_or_minsigned_nsw(
; CHECK-NEXT:    ret i8 0
;
  %signbit = and i8 %x, 128
  %neg = sub nsw i8 0, %signbit
  ret i8 %neg
}

define <2 x i8> @negate_zero_or_minsigned_nsw_vec(<2 x i8> %x) {
; CHECK-LABEL: @negate_zero_or_minsigned_nsw_vec(
; CHECK-NEXT:    ret <2 x i8> zeroinitializer
;
  %signbit = shl <2 x i8> %x, <i8 7, i8 7>
  %neg = sub nsw <2 x i8> zeroinitializer, %signbit
  ret <2 x i8> %neg
}

define i8 @negate_zero_or_minsigned(i8 %x) {
; CHECK-LABEL: @negate_zero_or_minsigned(
; CHECK-NEXT:    [[SIGNBIT:%.*]] = shl i8 %x, 7
; CHECK-NEXT:    ret i8 [[SIGNBIT]]
;
  %signbit = shl i8 %x, 7
  %neg = sub i8 0, %signbit
  ret i8 %neg
}

define <2 x i8> @negate_zero_or_minsigned_vec(<2 x i8> %x) {
; CHECK-LABEL: @negate_zero_or_minsigned_vec(
; CHECK-NEXT:    [[SIGNBIT:%.*]] = and <2 x i8> %x, <i8 -128, i8 -128>
; CHECK-NEXT:    ret <2 x i8> [[SIGNBIT]]
;
  %signbit = and <2 x i8> %x, <i8 128, i8 128>
  %neg = sub <2 x i8> zeroinitializer, %signbit
  ret <2 x i8> %neg
}
