# Shuffled Video Playlist with Segment Skipping

This project plays a shuffled playlist of videos in the browser, with support for:
- Starting and stopping videos at custom times
- Skipping defined segments in the middle
- Skipping a defined number of seconds from the end
- Automatically advancing through the shuffled playlist
- Stopping entirely at the end of the last video

## Project Structure

```
/
├── index.html           # Main video player
├── video-list.js        # Auto-generated video list
├── video-config.js      # Manual overrides: start, end, segments
├── generate.cmd         # Generates/updates video-list.js
└── videos/              # Folder containing all video files
```

## How to Use

1. Add your `.mp4` files inside the `videos/` directory.
2. Run `generate.cmd` to update the `video-list.js` file with the available videos.
3. Set your `start`, `end`, and `segments` overrides in `video-config.js`.

If `video-list.js` contains an entry like:

```js
{ src: 'videos/example-video-1.mp4' },
```

You can override it in `video-config.js` like this:

```js
{
  src: 'videos/example-video-1.mp4',
  start: 5,
  end: 25,
  segments: [
    { start: 10, end: 15 },
    { start: 25, end: 36 }
  ]
}
```

- `start`: the second to begin playback.
- `end`: how many seconds to skip from the end.
- `segments`: parts of the video to skip, defined by `start` and `end` in seconds.

> ⚠️ If you add more videos, you must rerun `generate.cmd`. This will overwrite `video-list.js` but will **not** touch `video-config.js`.

## Playback Logic

1. Videos are shuffled at load.
2. Each video:
    - Starts at `start`
    - Ends at `duration - end`
    - Skips time ranges in `segments`
3. Playback stops after the last video ends.

## Notes

- All time values are in **seconds**.
- Unconfigured videos play fully without skipping.

## How To Use In OBS:

- Add `videos.html` as a browser source.
- In OBS browser scene settings set URL as `file://C:/path/to/videos.html`

## License

MIT
