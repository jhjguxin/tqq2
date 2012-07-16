# encoding: utf-8
module Tqq2
  module Interface

    # Account API
    #
    # @see http://open.weibo.com/wiki/API%E6%96%87%E6%A1%A3_V2#.E8.B4.A6.E5.8F.B7
    class Account < Base

      # 获取用户基本信息 [Privilege]
      #
      # @param [Hash] opts
      # @option opts [int64] :uid 需要获取基本信息的用户UID，默认为当前登录用户
      #
      # @see http://wiki.open.t.qq.com/index.php/%E5%B8%90%E6%88%B7%E7%9B%B8%E5%85%B3/%E8%8E%B7%E5%8F%96%E8%87%AA%E5%B7%B1%E7%9A%84%E8%AF%A6%E7%BB%86%E8%B5%84%E6%96%99
      #http://open.t.qq.com/api/user/info?format=json
      def info(opts={})
        #get 'account/profile/basic.json', :params => opts
        get 'api/user/info', :params => opts
      end

      # 获取一批人的简单资料
      #
      # @param [Hash] opts
      # @option opts 用户id列表，用逗号“,”隔开，如 abc,edf,xxxx（最多30，可选）
      # 你需要读取的用户openid列表，用下划线“_”隔开，例如：B624064BA065E01CB73F835017FE96FA_B624064BA065E01CB73F835017FE96FB_B624064BA065E01CB73F835017FE96FC（个数与names保持一致，最多30，可选）
      # names和fopenids至少选一个，若同时存在则以names值为主
      # @see http://wiki.open.t.qq.com/index.php/%E5%B8%90%E6%88%B7%E7%9B%B8%E5%85%B3/%E8%8E%B7%E5%8F%96%E4%B8%80%E6%89%B9%E4%BA%BA%E7%9A%84%E7%AE%80%E5%8D%95%E8%B5%84%E6%96%99
      #http://open.t.qq.com/api/user/infos?format=json&names=abc,edf,xxx&fopenids=B624064BA065E01CB73F835017FE96FA_B624064BA065E01CB73F835017FE96FB_B624064BA065E01CB73F835017FE96FC
      def infos(opts={})
        #get 'account/profile/basic.json', :params => opts
        get 'api/user/infos', :params => opts
      end

      # 获取其他人资料
      # @see http://wiki.open.t.qq.com/index.php/%E5%B8%90%E6%88%B7%E7%9B%B8%E5%85%B3/%E8%8E%B7%E5%8F%96%E5%85%B6%E4%BB%96%E4%BA%BA%E8%B5%84%E6%96%99
      # http://open.t.qq.com/api/user/other_info?format=json&name=xxxx&fopenid=xxxx

      def other_info(name, fopenid, opts={})
        #get 'account/profile/basic.json', :params => opts
        get 'api/user/other_info', :params => {:name => name, :fopenid => fopenid}.merge(opts)
      end

      # 验证账户是否合法
      # @see http://wiki.open.t.qq.com/index.php/%E5%B8%90%E6%88%B7%E7%9B%B8%E5%85%B3/%E9%AA%8C%E8%AF%81%E8%B4%A6%E6%88%B7%E6%98%AF%E5%90%A6%E5%90%88%E6%B3%95
      # http://open.t.qq.com/api/user/verify
      #post包体格式为：
      #format=json&name=xxxx&fopenid=xxxx

      def verify(opts={})
        #get 'account/profile/basic.json', :params => opts
        post 'api/user/verify', :params => opts
      end


      # 获取心情微博
      # @see http://wiki.open.t.qq.com/index.php/%E5%B8%90%E6%88%B7%E7%9B%B8%E5%85%B3/%E8%8E%B7%E5%8F%96%E5%BF%83%E6%83%85%E5%BE%AE%E5%8D%9A
      # http://open.t.qq.com/api/user/emotion
      #post包体格式为：
      #format=json&name=xxxx&fopenid=B624064BA065E01CB73F835017FE96FA&reqnum=n&pageflag=0&type=0&contenttype=xxx&emotiontype=xx&id=xxx&timestamp=xx

      def emotion(opts={})
        #get 'account/profile/basic.json', :params => opts
        post 'api/user/emotion', :params => opts
      end

      # 获取用户的教育信息 [Privilege]
      #
      # @param [Hash] opts
      # @option opts [int64] :uid 需要获取教育信息的用户UID，默认为当前登录用户
      #
      # @see http://open.weibo.com/wiki/2/account/profile/education
      #def profile_education(opts={})
      #  get 'account/profile/education.json', :params => opts
      #end

      # 批量获取用户的教育信息 [Privilege]
      #
      # @param [String] uids 需要获取教育信息的用户UID，用半角逗号分隔，最多不超过20
      #
      # @see http://open.weibo.com/wiki/2/account/profile/education_batch
      #def profile_education_batch(uids)
      #  get 'account/profile/education_batch.json', :params => {:uids => uids}
      #end

      # 获取用户的职业信息 [Privilege]
      #
      # @param [Hash] opts
      # @option opts [int64] :uid 需要获取教育信息的用户UID，默认为当前登录用户
      #
      # @see http://open.weibo.com/wiki/2/account/profile/career
      #def profile_career(opts={})
      #  get 'account/profile/career.json', :params => opts
      #end

      # 批量获取用户的职业信息 [Privilege]
      #
      # @param [String] uids 需要获取教育信息的用户UID，用半角逗号分隔，最多不超过20
      #
      # @see http://open.weibo.com/wiki/2/account/profile/career_batch
      #def profile_career_batch(uids)
      #  get 'account/profile/career_batch.json', :params => uids
      #end

      # 获取当前登录用户的隐私设置
      #
      # @see http://open.weibo.com/wiki/2/account/get_privacy
      #def get_privacy
      #  get 'account/get_privacy.json'
      #end

      # 获取所有的学校列表
      #
      # @param [Hash] opts
      # @option opts [int] :province 省份范围，省份ID
      # @option opts [int] :city     城市范围，城市ID
      # @option opts [int] :area     区域范围，区ID
      # @option opts [int] :type     学校类型，1：大学、2：高中、3：中专技校、4：初中、5：小学，默认为1
      # @option opts [String] :capital 学校首字母，默认为A
      # @option opts [String] :keyword 学校名称关键字
      # @option opts [int] :count    返回的记录条数，默认为10
      #
      # @see http://open.weibo.com/wiki/2/account/profile/school_list
      #def profile_school_list(opts={})
      #  get 'account/profile/school_list.json', :params => opts
      #end

      # 获取当前登录用户的API访问频率限制情况
      #
      # @see http://open.weibo.com/wiki/2/account/rate_limit_status
      #def rate_limit_status
      #  get 'account/rate_limit_status.json'
      #end

      # OAuth授权之后，获取授权用户的UID
      #
      # @see http://open.weibo.com/wiki/2/account/get_uid
      #def get_uid
      #  get 'account/get_uid.json'
      #end

      #
      # write
      #

      # 更新用户的基本信息 [Privilege]
      #
      # @param [String] screen_name 用户昵称，不可为空
      # @param [int] province       省份代码ID，不可为空
      # @param [int] city           城市代码ID，不可为空
      # @param [String] gender      用户性别，m：男、f：女，不可为空
      # @param [Hash] opts
      # @option opts [String] :real_name      用户真实姓名
      # @option opts [int] :real_name_visible 真实姓名可见范围，0：自己可见、1：关注人可见、2：所有人可见
      # @option opts [date] :birthday         用户生日，格式：yyyy-mm-dd
      # @option opts [int] :birthday_visible  生日可见范围，0：保密、1：只显示月日、2：只显示星座、3：所有人可见
      # @option opts [String] :qq             用户QQ号码
      # @option opts [int] :qq_visible        用户QQ可见范围，0：自己可见、1：关注人可见、2：所有人可见
      # @option opts [String] :msn            用户MSN
      # @option opts [int] :msn_visible       用户MSN可见范围，0：自己可见、1：关注人可见、2：所有人可见
      # @option opts [String] :url            用户博客地址
      # @option opts [int] :url_visible       用户博客地址可见范围，0：自己可见、1：关注人可见、2：所有人可见
      # @option opts [int] :credentials_type  证件类型，1：身份证、2：学生证、3：军官证、4：护照
      # @option opts [String] :credentials_num 证件号码
      # @option opts [String] :email          用户常用邮箱地址
      # @option opts [int] :email_visible     用户常用邮箱地址可见范围，0：自己可见、1：关注人可见、2：所有人可见
      # @option opts [String] :lang           语言版本，zh_cn：简体中文、zh_tw：繁体中文
      # @option opts [String] :description    用户描述，最长不超过70个汉字
      #
      # @see http://wiki.open.t.qq.com/index.php/%E5%B8%90%E6%88%B7%E7%9B%B8%E5%85%B3/%E6%9B%B4%E6%96%B0%E7%94%A8%E6%88%B7%E4%BF%A1%E6%81%AF
      # http://open.t.qq.com/api/user/update
      #post包体格式为：
      #format=json&nick=aaa&sex=0&year=1987&month=7&day=15&countrycode=&provincecode=&citycode=&introduction=aaaa
      def update(nick, sex, year, month, day, provincecode, countrycode, citycode, introduction, opts={})
        body = {:nick => nick, :sex => sex, :year => year, :month => month, :day => day, :provincecode => provincecode, :countrycode =>countrycode, :citycode => citycode, :introduction =>introduction}.merge(opts)
        post 'account/profile/basic_update.json', :body => body
      end

      # 添加当前登录用户的教育信息 [Privilege]
      #
      # @param [int] type      学校类型，1：大学、2：高中、3：中专技校、4：初中、5：小学，默认为1
      # @param [int] school_id 学校代码
      # @param [Hash] opts
      # @option opts [String] :id 需要修改的教育信息ID，不传则为新建，传则为更新
      # @option opts [int] :year  入学年份，最小为1900，最大不超过当前年份
      # @option opts [String] :department 院系或者班别
      # @option opts [int] :visible 开放等级，0：仅自己可见、1：关注的人可见、2：所有人可见
      #
      # @see http://open.weibo.com/wiki/2/account/profile/edu_update
      def update_edu(year, departmentid, schoolid, level, opts={})
        post 'api/user/update_edu', :body => {:feildid => 1, :year => year, :departmentid => departmentid :schoolid => schoolid, :level => level}.merge(opts)
      end

      # 修改和删除用户教育信息 [Privilege]
      #
      # 修改和删除：fieldid通过调用user/info接口获取，删除：下面四个参数均为空）
      #
      # @see http://open.weibo.com/wiki/2/account/profile/edu_destroy
      def edu_destroy(fieldid,opts={})
        post 'api/user/update_edu', :body => { :feildid => fieldid, :year => '', :departmentid => '' :schoolid => '', :level => ''}.merge(opts)
      end

      # 更新当前登录用户的职业信息 [Privilege]
      #
      # @param [Hash] opts
      # @option opts [String] :id 需要更新的职业信息ID
      # @option opts [int] :start 进入公司年份，最小为1900，最大为当年年份
      # @option opts [int] :end   离开公司年份，至今填0
      # @option opts [String] :department 工作部门
      # @option opts [int] :visible  可见范围，0：自己可见、1：关注人可见、2：所有人可见
      # @option opts [int] :province 省份代码ID，不可为空值
      # @option opts [int] :city     城市代码ID，不可为空值
      # @option opts [String] :company 公司名称，不可为空值
      #
      # @see http://open.weibo.com/wiki/2/account/profile/car_update
      def profile_car_update(opts)
#        post 'account/profile/car_update.json', :body => opts
#      end

      # 根据公司ID删除用户的职业信息 [Privilege]
      #
      # @param [int64] id 职业信息里的公司ID
      #
      # @see http://open.weibo.com/wiki/2/account/profile/car_destroy
#      def profile_car_destroy(id)
#        post 'account/profile/car_destroy.json', :body => {:id => id}
#      end

      # no test
      # 更新当前登录用户的头像 [Privilege]
      #
      # @param [binary] image 头像图片，仅支持JPEG、GIF、PNG格式，图片大小小于5M.必须使用multipart/form-data方式提交
      #
      # @see http://wiki.open.t.qq.com/index.php/%E5%B8%90%E6%88%B7%E7%9B%B8%E5%85%B3/%E6%9B%B4%E6%96%B0%E7%94%A8%E6%88%B7%E5%A4%B4%E5%83%8F%E4%BF%A1%E6%81%AF
      def update_head(image)
        post 'api/user/update_head', :body => {:image => image}
      end

      # 更新当前登录用户的隐私设置 [Privilege]
      #
      # @param [Hash] opts
      # @option opts [int] :comment  是否可以评论我的微博，0：所有人、1：关注的人，默认为0
      # @option opts [int] :geo      是否开启地理信息，0：不开启、1：开启，默认为1
      # @option opts [int] :message  是否可以给我发私信，0：所有人、1：关注的人，默认为0
      # @option opts [int] :realname 是否可以通过真名搜索到我，0：不可以、1：可以，默认为0
      # @option opts [int] :badge    勋章是否可见，0：不可见、1：可见，默认为1
      # @option opts [int] :mobile   是否可以通过手机号码搜索到我，0：不可以、1：可以，默认为0
      #
      # @see http://open.weibo.com/wiki/2/account/update_privacy
#      def update_privacy(opts={})
#        post 'account/update_privacy.json', :body => opts
#      end
#    end
#  end
#end
