/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function Page(){
    this.pageNo = 1;//当前页码
    this.pageSize = 10;//每页最多记录数
    this.totalPage = -1;//总页数
    
    this.gotoFirst = function(){
        this.pageNo = 1;
    }
    this.gotoLast = function(){
    	 
        if(this.totalPage<0)
            throw Error("Total page is unknown!");
        this.pageNo = this.totalPage;
    }
    this.gotoNext = function(){
        if(this.totalPage<0)
            throw Error("Total page is unknown!");
        this.pageNo++;
        if(this.pageNo>this.totalPage){
            this.pageNo--;
        }
    }
    this.gotoPre = function(){
        this.pageNo--;
        if(this.pageNo<1){
            this.pageNo++;
        }
    }
    this.gotoIndex = function(pageNo){
        if(!pageNo) return;
        if(this.totalPage<0)
            throw Error("Total page is unknown!");
        if(pageNo<1){
            this.pageNo = 1;
        }else if(pageNo>this.totalPage){
            this.pageNo = totalPage;
        }else 
            this.pageNo = pageNo;
    }
    /**
     * 返回一数组，元素0表示开始页，元素1表示结束页
     */
    this.getPageRegion = function(){
        if(this.totalPage<0)
            throw Error("Total page is unknown!");
        if(this.totalPage<=4){
            return [1,this.totalPage];
        }
        var begin = ((this.pageNo -1) < 1 ? 1 : (this.pageNo -1));
        if(this.totalPage-begin>=3){
            var end = ((begin + 3) > this.totalPage ? this.totalPage : (begin + 3));
            return [begin,end];
        }
        return [this.totalPage-3,this.totalPage];
    }
}
