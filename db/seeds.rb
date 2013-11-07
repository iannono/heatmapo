
whst = Site.create(name: "whst.gov.cn", url: "http://www.whst.gov.cn")
whhd = Site.create(name: "whhd.gov.cn", url: "http://www.whhd.gov.cn")
wuchang = Site.create(name: "wuchang.gov.cn", url: "http://www.wuchang.gov.cn")
whcsq = Site.create(name: "whcsq.gov.cn", url: "http://www.whcsq.gov.cn")
hongshan = Site.create(name: "hongshan.gov.cn", url: "http://www.hongshan.gov.cn")
yichang = Site.create(name: "yichang.gov.cn", url: "http://www.yichang.gov.cn")
hbzf = Site.create(name: "hbzfhcxjst.gov.cn", url: "http://www.hbzfhcxjst.gov.cn")

def import_heats site, file_path
  lines = File.readlines file_path, "\n"
  lines.each_with_index do |line, index|
    line_ary = line.split(',')
    site.heats.create!(xpoint: line_ary[0], ypoint: line_ary[1], screen_ratio: "700*455")
    puts index
  end
end

import_heats whst, "db/import_data/kejiju.csv"
import_heats whhd, "db/import_data/gongshangju.csv"
import_heats wuchang, "db/import_data/wuchang.csv"
import_heats whcsq, "db/import_data/chengshiquan.csv"
import_heats hongshan, "db/import_data/hongshan.csv"
import_heats yichang, "db/import_data/yichang.csv"
import_heats hbzf, "db/import_data/gongjijing.csv"
