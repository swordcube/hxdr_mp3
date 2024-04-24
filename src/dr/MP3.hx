package dr;


// WARNING: This will not have every feature dr_mp3 has to offer!
//
// Make an issue explaining what feature you want implemented over on GitHub!
// https://github.com/swordcube/hxdr_mp3/issues

@:include("vendor/include/dr_mp3.h")
@:buildXml("<include name=\"${haxelib:hxdr_mp3}/include.xml\"/>")
extern class MP3 {
    @:native('drmp3_open_file_and_read_pcm_frames_s16')
    static inline function openFileAndReadPCMFramesShort16(fileName:cpp.ConstCharStar, config:cpp.Pointer<DrMP3Config>, totalFrameCount:DrMP3UInt64, allocationCallbacks:cpp.ConstPointer<DrMP3AllocationCallbacks>):cpp.RawPointer<cpp.Int16> {
		return untyped __cpp__("drmp3_open_file_and_read_pcm_frames_s16({0}, {1}, {2}, {3})", fileName, config, cpp.Pointer.addressOf(totalFrameCount), allocationCallbacks);
	}
    
    static inline function free(data:Any, allocationCallbacks:cpp.ConstPointer<DrMP3AllocationCallbacks>):Void {
        untyped __cpp__('drmp3_free((void*){0}, {1})', data, allocationCallbacks);
    }
}

@:include("vendor/include/dr_mp3.h")
@:buildXml("<include name=\"${haxelib:hxdr_mp3}/include.xml\"/>")
@:native('drmp3_allocation_callbacks')
@:structAccess
extern class DrMP3AllocationCallbacks {
	var userData:Any;

	var onMalloc:Any;
	var onRealloc:Any;
	var onFree:Any;
}

@:include("vendor/include/dr_mp3.h")
@:buildXml("<include name=\"${haxelib:hxdr_mp3}/include.xml\"/>")
@:native('drmp3_config')
@:structAccess
extern class DrMP3Config {
    var channels:cpp.UInt32;
    var sampleRate:cpp.UInt32;
}

@:native("drmp3_uint64")
@:scalar @:coreType @:notNull
extern abstract DrMP3UInt64 from Int to Int {}