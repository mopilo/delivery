part of theme;

class AppTextStyles {
  static const titleBold = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
      letterSpacing: 0.5

  );

  static const titleMedium =  TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

  static const bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.secondaryTextColor,
      letterSpacing: 0.5

  );

  static const bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );

  static const body2Regular = TextStyle(
    fontSize: 14,
    color: AppColors.black,
    fontWeight: FontWeight.w500,

  );
}