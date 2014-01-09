package com.storemanager.store.test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.sql.SQLException;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.AfterTransaction;
import org.springframework.test.context.transaction.BeforeTransaction;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.storemanager.store.dao.StoreDAO;
import com.storemanager.store.model.CheckinForm;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration
@TransactionConfiguration
@Transactional
public class StoreDAOTest extends AbstractTransactionalJUnit4SpringContextTests {

    //final Logger logger = LoggerFactory.getLogger(StoreDAOTest.class);
    
    protected static int SIZE = 2;
    protected static Long ID = new Long(1);
    protected static String PRODTYPE="Phone";
    protected static String CONSIGNEE="consignee";
    protected static String ORDERNO="8546132135";
    protected static String PRODUCT="Samsung Galaxy note 2";
    protected static Long PRODUCTBAL= new Long(90);
    protected static String CARRIER="carroer";
  /*  protected static String FIRST_NAME = "protected static String PRODTPE="Phone";Joe";
    protected static String LAST_NAME = "Smith";
    protected static String CHANGED_LAST_NAME = "Jackson";*/

    @Autowired
    protected StoreDAO storeDao = null;
    
    /**
     * Tests that the size and first record match what is expected 
     * before the transaction.
     */
    @BeforeTransaction
    public void beforeTransaction() {
        testStore(true, PRODTYPE);
    }

    /**
     * Tests person table and changes the first records last name.
     */
    @Test
    public void testHibernateTemplate() throws SQLException {
        assertNotNull("Stoer DAO is null.", storeDao);
        
        Collection<CheckinForm> lPersons = storeDao.fetchAllFromStore();
        
        assertNotNull("Person list is null.", lPersons);
        assertEquals("Number of persons should be " + SIZE + ".", SIZE, lPersons.size());
        
        for (CheckinForm form : lPersons) {
            assertNotNull("Person is null.", form);
                        
            if (ID.equals(form.getId())) {                
//                assertEquals("Person first name should be " + FIRST_NAME + ".", FIRST_NAME, person.getFirstName());
  //              assertEquals("Person last name should be " + LAST_NAME + ".", LAST_NAME, person.getLastName());
                
                
                //storeDao.save(person);
            }
        }
    }

    /**
     * Tests that the size and first record match what is expected 
     * after the transaction.
     */
    @AfterTransaction
    public void afterTransaction() {
        testStore(false, PRODTYPE);
    }

    /**
     * Tests person table.
     */
    protected void testStore(boolean beforeTransaction, String matchLastName) {
        List<Map<String, Object>> lPersonMaps = simpleJdbcTemplate.queryForList("SELECT * FROM STORE");

        assertNotNull("Person list is null.", lPersonMaps);
        assertEquals("Number of persons should be " + SIZE + ".", SIZE, lPersonMaps.size());

        Map<String, Object> hPerson = lPersonMaps.get(0);

        System.out.println((beforeTransaction ? "Before" : "After") + " transaction.  " + hPerson.toString());
            
        Integer id = (Integer)hPerson.get("ID");
        String firstName = (String)hPerson.get("PRODTYPE");
        String lastName = (String)hPerson.get("CONSIGNEE");
        
        if (ID.equals(id)) {                
            //assertEquals("Person first name should be " + FIRST_NAME + ".", FIRST_NAME, firstName);
            //assertEquals("Person last name should be " + matchLastName + ".", matchLastName, lastName);
        }
    }
    
}