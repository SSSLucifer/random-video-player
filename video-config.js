// Set your start, end offsets, and skipped segments here.
//
// If the auto-generated file contains an entry like this:
// { src: 'videos/example-video-1.mp4' },
//
// Add a line like this to set you custom start and end offsets:
// { src: 'videos/video-file.mp4', start: 5, end: 25, segments: [] },

// Start: the second to start at.
// end: how many seconds from the end to skip.
// segments: parts of the video to skip, start and end in seconds

const updatedVideoFiles = [
    {src: 'videos/example-video-1.mp4', start: 15, end: 3, segments: [{start: 10, end: 15}, {start: 25, end: 36}]},
    {src: 'videos/example-video-2.mp4', start: 0, end: 0, segments: [{start: 76, end: 103}]},
    {src: 'videos/example-video-3.mp4', start: 5, end: 0, segments: []}
];
