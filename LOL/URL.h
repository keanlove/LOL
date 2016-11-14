//
//  URL.h
//  LOL
//
//  Created by Kean on 16/7/4.
//  Copyright © 2016年 Kean. All rights reserved.
//

#ifndef URL_h
#define URL_h

// 所有英雄
#define ALLHERO_URL @"http://v.wanmeixx.com/Ajax20151126.ashx?g=1&act=GetHeroList"

// 免费英雄
#define Free_URL @"http://api.tgp.apilol.com/Weeks?uid=616&tokenid=543337&tokenkey=4bfozu2si224294t"
#define FreeIcon_URL @"http://ossweb-img.qq.com/images/lol/img/champion/"

// 英雄视频
#define VideoURL_1 @"http://v.wanmeixx.com/Ajax20151126.ashx?g=1&act=GetVideoList&heroId="

#define VideoURL_2 @"&authorId=0&keyword=&page="

#define VideoURL_3 @"&pageSize=10&order=new&albumId=0&isIpad=0"
#define PlayURL_1 @"http://v.wanmeixx.com/ajax20151126.ashx?act=GetYouKuUrls&id="

#define PlayURL_2 @"&format="


// 最近更新
#define Recent_URL @"http://v.wanmeixx.com/Ajax20151126.ashx?g=1&act=GetVideoList&heroId=0&authorId=0&keyword=&page=1&pageSize=10&order=new&albumId=0&isIpad=0"
/*
 MoreRecent
 http://v.wanmeixx.com/Ajax20151126.ashx?g=1&act=GetVideoList&heroId=0&authorId=0&keyword=&page=2&pageSize=10&order=new&albumId=0&isIpad=0
 */
#define RecentRUL_1 @"http://v.wanmeixx.com/Ajax20151126.ashx?g=1&act=GetVideoList&heroId=0&authorId=0&keyword=&page="

#define RecentRUL_2 @"&pageSize=10&order=new&albumId=0&isIpad=0"



// 最新比赛
#define Competition_URL @"http://lolbox.oss.aliyuncs.com/json/v4/video/videolist_4_319_1.json?r=459218"
#define CompetitionURL_1 @"http://121.41.43.170:8181//YouKuServer/servlet/PagedContestVideoServlet?curPage="

#define  CompetitionURL_2 @"&type=lol"



// 主播解说人物
#define Anchor_URL @"http://v.wanmeixx.com/Ajax20151126.ashx?g=1&act=GetAuthorList&page=1&pageSize=5000&order=pubtime"

// 主播解说视频
#define AnchorVideo_URL @"http://v.wanmeixx.com/Ajax20151126.ashx?g=1&act=GetVideoList&heroId=0&authorId=3&keyword=&page=1&pageSize=10&order=new&albumId=0&isIpad=0"

#define AnchorVideoURL_1 @"http://v.wanmeixx.com/Ajax20151126.ashx?g=1&act=GetVideoList&heroId=0&authorId="

#define AnchorVideoURL_2 @"&keyword=&page="

#define AnchorVideoURL_3 @"&pageSize=10&order=new&albumId=0&isIpad=0"

/**
 *  直播视频
 */

#define LiveURL @"http://v.wanmeixx.com/Ajax20151126.ashx?g=1&act=GetLiveList"

// 战旗直播URL

#define ZhanQiURL @"http://114.215.80.125/lol/index.php/VideoSdk/apiLives"

/**
 *  LiveVideoURL
 */

#define LiveVideoURL @"http://v.wanmeixx.com/Ajax20151126.ashx?g=6&act=GetLiveM3U8&r=74325"

#define LiveVideoURL_1 @"http://v.wanmeixx.com/Ajax20151126.ashx?g=6&act=GetLiveM3U8&r="



#endif /* URL_h */












