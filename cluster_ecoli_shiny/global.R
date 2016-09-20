palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
          "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))

ecoli = read.csv("~/MBSW2016-Workshop/cluster_ecoli_shiny/data/ecoli.csv", header = F, sep = "")
ecoli = ecoli[-c(1,4,5,9)]
colnames(ecoli) = c("mcg", "gvh", "aac", "alm1", "alm2")