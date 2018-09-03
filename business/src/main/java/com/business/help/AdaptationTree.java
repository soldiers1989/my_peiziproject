package com.business.help;

import java.util.ArrayList;
import java.util.List;

import com.base.util.WebUtils;
import com.business.entity.AuthConfigEntity;

public class AdaptationTree {

    public static List<Dynatree> getResultTrees(List<AuthConfigEntity> authconfigEntities) throws Exception {
	List<Dynatree> resultTrees = new ArrayList<Dynatree>();
	Dynatree rootTree = getRootTree(authconfigEntities);
	getTreeChildren(rootTree, authconfigEntities);
	resultTrees.add(rootTree);
	return resultTrees;

    }

    public static Dynatree getRootTree(List<AuthConfigEntity> authconfigEntities) throws Exception {
	Dynatree rootTree = new Dynatree();
	List<AuthConfigEntity> authconfigEntities2 = new ArrayList<AuthConfigEntity>();
	for (AuthConfigEntity authconfigEntity : authconfigEntities) {
	    if (authconfigEntity.getPid() == 0) {
		authconfigEntities2.add(authconfigEntity);
	    }
	}
	if (authconfigEntities2.size() == 0) {
	    return rootTree;
	}
	AuthConfigEntity authconfigEntityRoot = authconfigEntities2.get(0);
	rootTree.setTitle(authconfigEntityRoot.getName());
	rootTree.setKey(authconfigEntityRoot.getId() + "");
	rootTree.setExpand(true);
	return rootTree;
    }

    /**
     * 递归的增加子树
     */
    private static void getTreeChildren(Dynatree dynatree, List<AuthConfigEntity> authconfigEntities) {
	try {
	    List<AuthConfigEntity> authconfigEntitysCerrent = getChildrenAuthConfig(dynatree, authconfigEntities);
	    if (!WebUtils.isEmpty(authconfigEntitysCerrent)) {
		List<Dynatree> childrenTrees = new ArrayList<Dynatree>();
		for (AuthConfigEntity authconfigEntity : authconfigEntitysCerrent) {
		    Dynatree tree = new Dynatree();
		    tree.setKey(authconfigEntity.getId() + "");
		    tree.setTitle(authconfigEntity.getName());
		    tree.setExpand(true);
		    getTreeChildren(tree, authconfigEntities);
		    childrenTrees.add(tree);
		}
		dynatree.setChildren(childrenTrees);
	    }

	} catch (NumberFormatException e) {
	} catch (Exception e) {
	    e.printStackTrace();
	}
    }

    private static List<AuthConfigEntity> getChildrenAuthConfig(Dynatree dynatree, List<AuthConfigEntity> authconfigEntities) throws Exception {
	List<AuthConfigEntity> authconfigEntitys2 = new ArrayList<AuthConfigEntity>();
	for (AuthConfigEntity authconfigEntity : authconfigEntities) {
	    if (authconfigEntity.getPid() == Long.valueOf(dynatree.getKey()).longValue()) {
		authconfigEntitys2.add(authconfigEntity);
	    }
	}
	return authconfigEntitys2;
    }
}
