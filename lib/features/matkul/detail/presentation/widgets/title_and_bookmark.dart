part of '_widgets.dart';

class TitleAndBookMark extends StatelessWidget {
  const TitleAndBookMark({
    required this.course,
    super.key,
  });

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                course.name.toString(),
                style: FontTheme.poppins20w700black(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: OnReactive(() {
                return GestureDetector(
                  onTap: () {
                    // store if course is currently bookmarked or not
                    // to prevent "bookmarked" tracking when user is actually
                    // un-bookmarking a course
                    final isCurrentlyBookmarked = bookmarkRM.state.isMarked(
                      course,
                    );

                    final bookmark = BookmarkModel(
                      courseId: course.id,
                      courseCode: course.code,
                      courseName: course.name,
                      courseCodeDesc: course.codeDesc,
                      courseReviewCount: course.reviewCount,
                      shortName: course.shortName,
                    );
                    bookmarkRM.setState((s) => s.toggleBookmark(bookmark));

                    if (!isCurrentlyBookmarked) {
                      MixpanelService.track(
                        CourseBookmarkedEvent(
                          matkulId: course.id.toString(),
                          matkulName: course.name ?? 'Unknown',
                        ),
                      );
                    }
                  },
                  child: Icon(
                    Icons.bookmark,
                    color: bookmarkRM.state.isMarked(course)
                        ? BaseColors.goldenrod
                        : BaseColors.gray3,
                  ),
                );
              }),
            ),
          ],
        ),
        const HeightSpace(8),
        Text(
          course.describe,
          style: FontTheme.poppins16w500black(),
        ),
      ],
    );
  }
}
